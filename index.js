#!/usr/bin/env node
const program = require('commander')
const Word = require('./lib/word')
const version = require('./package.json').version

let searchWord = ''
program
  .version(version)
  .arguments('<word>', 'look up a word')
  .action(function(word){
    searchWord = word
  })
  .parse(process.argv);

if(!searchWord){
  console.log('Usage: '+ program._name +' --help')
}
else {
  const app = new Word(searchWord)

  app.run()
}
