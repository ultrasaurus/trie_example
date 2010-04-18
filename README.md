# Trie Example

This is a dictionary implemented as a trie, inspired by Tyler McMullen's LA RubyConf 2010 talk: http://www.scribd.com/doc/27149829/Alternative-Data-Structures-in-Ruby

There are also naive implementations using Array and Set that are fun for comparing performance and memory footprint.

How to use it:
<pre>
>> require 'trie_dictionary'
=> true
>> d = Dictionary.new
=> #<Dictionary:0x10165bb00 @tree={}>
>> d.add ("fish")
(irb):7: warning: don't put space before argument parentheses
=> true
>> d.add("fiend")
=> true
>> d.add("foo")
=> true
>> d.find('f')
=> ["fish", "fiend", "foo"]
>> d.find('fi')
=> ["fish", "fiend"]
>> d.find('fo')
=> ["foo"]
</pre>

Alternate implementation Performance results:

* [http://github.com/RyOnLife/trie_example](http://github.com/RyOnLife/trie_example)
* [http://github.com/aihui/ruby_prof_test](http://github.com/aihui/ruby_prof_test)
* [http://github.com/inkredabull/MyRubyClassAssignments/](http://github.com/inkredabull/MyRubyClassAssignments/)
  * [Data](http://github.com/inkredabull/MyRubyClassAssignments/blob/master/random.rb)
  * [Data generator](http://github.com/inkredabull/MyRubyClassAssignments/blob/master/random_word_generator.rb)
  * [Perf test implementation](http://github.com/inkredabull/MyRubyClassAssignments/blob/master/random_perf_test.rb)
  * [Perf test results](http://github.com/inkredabull/MyRubyClassAssignments/blob/master/random_words_result.txt)

