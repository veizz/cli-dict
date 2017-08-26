const mysql = require('mysql')
const request = require('request')

const config = require('../conf/index')

let Word = function(word) {
  this.word = word
  this.conn = mysql.createConnection(config.mysql)
  this.conn.connect()
}

Word.prototype.run =  function() {
  let self = this
  self.get(function(row){
    if(row){
      let displayRow = Object.assign({}, row)
      displayRow.cnt += 1
      self.display(displayRow)
      const id = parseInt(row.id, 10)
      self.update(id, function(){
        // close connection
        self.conn.end()
      })
    } else {
      self.getFromApi(function(row){
        self.display(row)
        self.add(row, function(){
          // close connection
          self.conn.end()
        })
      })
    }
  })
}

Word.prototype.add = function(row, cb) {
  let self = this
  let keys = Object.keys(row).join(', ')
  let values = Object.keys(row).fill('?').join(', ')
  let rowItems = []
  Object.keys(row).forEach(function(item){
    rowItems.push(row[item])
  })
  let query_str = 'insert into tbl_words ('+ keys +', example) values ('+ values +', "")'

  self.conn.query(query_str, rowItems, function(err, results){
    return  cb && cb()
  })
}

Word.prototype.update = function(id, cb) {
  let self = this
  self.conn.query('update tbl_words set cnt=cnt+1 where id=?', [id], function(err, results, fields){
    return cb && cb()
  })
}  

Word.prototype.get = function(cb) {
  let self = this
  let word = self.word
  self.conn.query('SELECT * from tbl_words where `word`=?', [word], function(err, results, fields){
    let res = null
    if(results && results.length > 0){
      res = results[0]
    }
    return cb(res)
  })
}

Word.prototype.getFromApi = function(cb) {
  let self = this
  const url = 'http://dict-co.iciba.com/api/dictionary.php?key=' + config.iciba_key + '&type=json&w=' + encodeURIComponent(self.word)
  return request.get({
    headers:{
      connection: false,
    },
    uri:url
  }, function(err, res, body){

    const d = formatData(body)
    return cb && cb(d)
  })

  function formatData(data) {
    const obj = JSON.parse(data)
    if(!obj || !obj.word_name){
      return null
    }
    let symbol = obj.symbols[0]
    return {
      word: obj.word_name,
      exchange: JSON.stringify(obj.exchange),
      means: JSON.stringify(symbol.parts),
      pronounce_uk: symbol.ph_en,
      pronounce_us: symbol.ph_am,
      uk_mp3: symbol.ph_en_mp3,
      us_mp3: symbol.ph_am_mp3,
      tts_mp3: symbol.ph_tts_mp3,
      cnt: 1,
    }
  }
}

Word.prototype.display = function(data) {
  if(!data){
    console.log('not found')
    return process.exit(-1)
  }
  const means_str = getMeanStr(data)
  const exchange_str = getExchangeStr(data)

  let str = `${data.word} [${data.cnt}次]
  英[${data.pronounce_uk}] 美[${data.pronounce_us}]
  ${means_str}
  ${exchange_str}
`
  console.log(str)

  function getExchangeStr(data) {
    const excgs = JSON.parse(data.exchange)
    const key_name = {
      word_pl: '复数',
      word_past: '过去式',
      word_done: '过去分词',
      word_ing: '现在分词',
      word_third: '第三人称单数',
      word_er: '比较级',
      word_est: '最高级',
    }
    let excg_arr = []
    Object.keys(excgs).forEach(function(key){
      if(excgs[key]){
        excg_arr.push(key_name[key] + ': ' + excgs[key])
      }
    })
    return excg_arr.join('; ')
  }
  function getMeanStr(data) {
    const means = JSON.parse(data.means)
    return means.map((mean) => {
      let m = mean.means.join('; ')
      if(!m) {
        return null
      }
      return mean.part + ' ' + m
    }).join('\n  ')
  }
}

module.exports = Word
