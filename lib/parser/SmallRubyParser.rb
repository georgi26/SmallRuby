#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.7.1
# from Racc grammar file "".
#

require 'racc/parser.rb'

#
module SR
  class Parser < Racc::Parser

module_eval(<<'...end SmallRubyParser.y/module_eval...', 'SmallRubyParser.y', 88)
    def parse(tokens)
        @tokens = tokens
        do_parse
    end

    def next_token
        @tokens.shift
    end
...end SmallRubyParser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     3,     9,    55,     4,     5,     6,    22,    64,    56,     7,
     8,    25,    10,    10,    11,     3,     9,    25,     4,     5,
     6,    22,    50,    62,     7,     8,    25,    25,    10,    11,
     3,     9,    25,     4,     5,     6,    32,    50,    26,     7,
     8,    25,    27,    10,    11,     3,     9,    28,     4,     5,
     6,    22,    30,    24,     7,     8,    44,    34,    10,    11,
     3,     9,    36,     4,     5,     6,    22,    38,    24,     7,
     8,    57,    25,    10,    11,     3,     9,    25,     4,     5,
     6,    22,    25,    24,     7,     8,    61,    25,    10,    11,
     3,     9,    69,     4,     5,     6,    22,    10,    24,     7,
     8,    68,    25,    10,    11,     3,     9,    10,     4,     5,
     6,    32,   nil,    24,     7,     8,    74,   nil,    10,    11,
     3,     9,   nil,     4,     5,     6,    22,    59,    60,     7,
     8,   -34,    30,    10,    11,     3,    47,   nil,     4,     5,
     6,    22,    46,   nil,     7,     8,    73,    64,    10,    11,
     3,     9,   nil,     4,     5,     6,    22,   nil,   nil,     7,
     8,   nil,   nil,    10,    11,     3,     9,   nil,     4,     5,
     6,    22,   nil,   nil,     7,     8,   nil,   nil,    10,    11,
     3,     9,   nil,     4,     5,     6,    54,   nil,   nil,     7,
     8,   nil,   nil,    10,    11,     3,     9,   nil,     4,     5,
     6,    22,   nil,   nil,     7,     8,   nil,   nil,    10,    11,
     3,     9,   nil,     4,     5,     6,    22,    66,   nil,     7,
     8,   nil,   nil,    10,    11,     3,     9,   nil,     4,     5,
     6,    22,   nil,   nil,     7,     8,   nil,   nil,    10,    11,
     3,     9,   nil,     4,     5,     6,    22,   nil,   nil,     7,
     8,   nil,   nil,    10,    11,    23,   nil,    24 ]

racc_action_check = [
     0,     0,    39,     0,     0,     0,     0,    53,    40,     0,
     0,    39,    53,     0,     0,     8,     8,    40,     8,     8,
     8,     8,    35,    49,     8,     8,    35,    49,     8,     8,
    10,    10,     2,    10,    10,    10,    10,    65,     3,    10,
    10,    65,     4,    10,    10,    22,    22,     7,    22,    22,
    22,    22,     9,    31,    22,    22,    31,    11,    22,    22,
    24,    24,    23,    24,    24,    24,    24,    25,    41,    24,
    24,    41,    29,    24,    24,    26,    26,    37,    26,    26,
    26,    26,    43,    48,    26,    26,    48,    51,    26,    26,
    27,    27,    60,    27,    27,    27,    27,    66,    58,    27,
    27,    58,    71,    27,    27,    28,    28,    73,    28,    28,
    28,    28,   nil,    70,    28,    28,    70,   nil,    28,    28,
    30,    30,   nil,    30,    30,    30,    30,    45,    45,    30,
    30,    47,    47,    30,    30,    32,    32,   nil,    32,    32,
    32,    32,    32,   nil,    32,    32,    67,    67,    32,    32,
    33,    33,   nil,    33,    33,    33,    33,   nil,   nil,    33,
    33,   nil,   nil,    33,    33,    34,    34,   nil,    34,    34,
    34,    34,   nil,   nil,    34,    34,   nil,   nil,    34,    34,
    38,    38,   nil,    38,    38,    38,    38,   nil,   nil,    38,
    38,   nil,   nil,    38,    38,    42,    42,   nil,    42,    42,
    42,    42,   nil,   nil,    42,    42,   nil,   nil,    42,    42,
    54,    54,   nil,    54,    54,    54,    54,    54,   nil,    54,
    54,   nil,   nil,    54,    54,    62,    62,   nil,    62,    62,
    62,    62,   nil,   nil,    62,    62,   nil,   nil,    62,    62,
    64,    64,   nil,    64,    64,    64,    64,   nil,   nil,    64,
    64,   nil,   nil,    64,    64,     1,   nil,     1 ]

racc_action_pointer = [
    -3,   255,    18,    34,    38,   nil,   nil,    43,    12,    37,
    27,    48,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    42,    62,    57,    63,    72,    87,   102,    58,
   117,    51,   132,   147,   162,    12,   nil,    63,   177,    -3,
     3,    66,   192,    68,   nil,   117,   nil,   117,    81,    13,
   nil,    73,   nil,    -4,   207,   nil,   nil,   nil,    96,   nil,
    88,   nil,   222,   nil,   237,    27,    81,   136,   nil,   nil,
   111,    88,   nil,    91,   nil,   nil ]

racc_action_default = [
   -40,   -41,    -1,   -41,   -41,    -5,    -6,   -41,   -40,   -34,
   -40,   -41,   -28,   -29,   -30,   -31,   -32,   -33,   -35,   -36,
   -37,   -38,   -40,   -41,   -40,   -41,   -40,   -40,   -40,   -13,
   -40,   -41,   -40,   -40,   -40,   -41,    76,    -2,   -14,   -41,
   -41,   -41,   -40,   -24,   -25,   -41,    -8,    -9,   -41,   -41,
   -39,   -22,   -15,   -16,   -40,    -3,    -4,   -11,   -41,    -7,
   -41,   -26,   -40,   -17,   -40,   -22,   -18,   -41,   -12,   -10,
   -41,   -23,   -20,   -19,   -27,   -21 ]

racc_goto_table = [
     1,    29,    53,    45,    33,   nil,    52,   nil,   nil,   nil,
    31,   nil,   nil,   nil,   nil,    35,   nil,    37,    67,    39,
    40,    63,    42,    43,   nil,    35,   nil,    49,    41,   nil,
   nil,    51,   nil,    48,    72,   nil,   nil,   nil,   nil,   nil,
   nil,    75,    58,   nil,   nil,   nil,   nil,    65,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    71,   nil,   nil,
   nil,   nil,    70 ]

racc_goto_check = [
     1,     2,    13,     8,     7,   nil,    12,   nil,   nil,   nil,
     1,   nil,   nil,   nil,   nil,     2,   nil,     2,    13,     2,
     2,    12,     7,     2,   nil,     2,   nil,     2,     1,   nil,
   nil,     2,   nil,     1,    12,   nil,   nil,   nil,   nil,   nil,
   nil,    12,     1,   nil,   nil,   nil,   nil,     2,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     2,   nil,   nil,
   nil,   nil,     1 ]

racc_goto_pointer = [
   nil,     0,    -7,   nil,   nil,   nil,   nil,    -6,   -29,   nil,
   nil,   nil,   -32,   -36,   nil,   nil ]

racc_goto_default = [
   nil,   nil,     2,    12,    13,    17,    16,   nil,   nil,    14,
    21,    15,    20,   nil,    18,    19 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 19, :_reduce_1,
  3, 19, :_reduce_2,
  4, 21, :_reduce_3,
  4, 22, :_reduce_4,
  1, 23, :_reduce_5,
  1, 24, :_reduce_6,
  3, 25, :_reduce_7,
  2, 25, :_reduce_8,
  1, 26, :_reduce_9,
  3, 26, :_reduce_10,
  4, 27, :_reduce_11,
  5, 27, :_reduce_12,
  2, 28, :_reduce_13,
  3, 29, :_reduce_14,
  4, 29, :_reduce_15,
  4, 29, :_reduce_16,
  5, 29, :_reduce_17,
  5, 29, :_reduce_18,
  6, 29, :_reduce_19,
  6, 29, :_reduce_20,
  7, 29, :_reduce_21,
  1, 31, :_reduce_22,
  3, 31, :_reduce_23,
  3, 32, :_reduce_24,
  3, 30, :_reduce_25,
  4, 30, :_reduce_26,
  6, 33, :_reduce_27,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  3, 20, :_reduce_39,
  0, 20, :_reduce_40 ]

racc_reduce_n = 41

racc_shift_n = 76

racc_token_table = {
  false => 0,
  :error => 1,
  ";" => 2,
  "module" => 3,
  :CONST => 4,
  "end" => 5,
  "class" => 6,
  :STRING => 7,
  :NUMBER => 8,
  "(" => 9,
  ")" => 10,
  "," => 11,
  "def" => 12,
  "return" => 13,
  "." => 14,
  "=" => 15,
  "do" => 16,
  "while" => 17 }

racc_nt_base = 18

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]
Ractor.make_shareable(Racc_arg) if defined?(Ractor)

Racc_token_to_s_table = [
  "$end",
  "error",
  "\";\"",
  "\"module\"",
  "CONST",
  "\"end\"",
  "\"class\"",
  "STRING",
  "NUMBER",
  "\"(\"",
  "\")\"",
  "\",\"",
  "\"def\"",
  "\"return\"",
  "\".\"",
  "\"=\"",
  "\"do\"",
  "\"while\"",
  "$start",
  "expList",
  "exp",
  "module",
  "class",
  "string",
  "number",
  "args",
  "argsList",
  "def",
  "return",
  "send",
  "block",
  "sendExpList",
  "assign",
  "while" ]
Ractor.make_shareable(Racc_token_to_s_table) if defined?(Ractor)

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'SmallRubyParser.y', 3)
  def _reduce_1(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 5)
  def _reduce_2(val, _values, result)
    result.push(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 8)
  def _reduce_3(val, _values, result)
     result = [:module,val[1],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 10)
  def _reduce_4(val, _values, result)
     result = [:class,val[1],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 12)
  def _reduce_5(val, _values, result)
    result = [:string,val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 15)
  def _reduce_6(val, _values, result)
    result = [:number,val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 18)
  def _reduce_7(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 20)
  def _reduce_8(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 23)
  def _reduce_9(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 25)
  def _reduce_10(val, _values, result)
    result.push(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 28)
  def _reduce_11(val, _values, result)
    result = [:def,val[1],[],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 30)
  def _reduce_12(val, _values, result)
    result = [:def,val[1],val[2],val[3]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 33)
  def _reduce_13(val, _values, result)
    result = [:return,val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 36)
  def _reduce_14(val, _values, result)
     result = [:send,val[0],val[2],[]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 38)
  def _reduce_15(val, _values, result)
     result = [:send,val[0],val[2],[],val[3]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 40)
  def _reduce_16(val, _values, result)
     result = [:send,val[0],val[2],val[3]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 42)
  def _reduce_17(val, _values, result)
     result = [:send,val[0],val[2],val[3],val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 44)
  def _reduce_18(val, _values, result)
     result = [:send,val[0],val[2],[]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 46)
  def _reduce_19(val, _values, result)
     result = [:send,val[0],val[2],val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 48)
  def _reduce_20(val, _values, result)
     result = [:send,val[0],val[2],[],val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 50)
  def _reduce_21(val, _values, result)
     result = [:send,val[0],val[2],val[4],val[6]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 53)
  def _reduce_22(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 55)
  def _reduce_23(val, _values, result)
    result.push(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 58)
  def _reduce_24(val, _values, result)
    result = [:assign,val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 61)
  def _reduce_25(val, _values, result)
    result = [:block,[],val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 63)
  def _reduce_26(val, _values, result)
    result = [:block,val[1],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 66)
  def _reduce_27(val, _values, result)
    result = [:while,val[2],val[4]]
    result
  end
.,.,

# reduce 28 omitted

# reduce 29 omitted

# reduce 30 omitted

# reduce 31 omitted

# reduce 32 omitted

# reduce 33 omitted

# reduce 34 omitted

# reduce 35 omitted

# reduce 36 omitted

# reduce 37 omitted

# reduce 38 omitted

module_eval(<<'.,.,', 'SmallRubyParser.y', 80)
  def _reduce_39(val, _values, result)
     result=val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 82)
  def _reduce_40(val, _values, result)
    result = []
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
end   # module SR

#
