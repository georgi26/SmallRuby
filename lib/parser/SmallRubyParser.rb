#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.7.1
# from Racc grammar file "".
#

require 'racc/parser.rb'

#
module SR
  class Parser < Racc::Parser

module_eval(<<'...end SmallRubyParser.y/module_eval...', 'SmallRubyParser.y', 92)
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
     3,    10,    56,     4,     5,     6,     7,    24,    61,    62,
     8,    27,     9,    27,    11,    12,     3,    10,    55,     4,
     5,     6,     7,    24,    26,    11,     8,    47,     9,    28,
    11,    12,     3,    10,    29,     4,     5,     6,     7,    34,
    53,    30,     8,    27,     9,    32,    11,    12,     3,    10,
    36,     4,     5,     6,     7,    24,    26,    38,     8,    57,
     9,    40,    11,    12,     3,    10,    27,     4,     5,     6,
     7,    24,    26,    27,     8,    58,     9,    60,    11,    12,
     3,    10,    27,     4,     5,     6,     7,    24,    26,    71,
     8,    63,     9,    27,    11,    12,     3,    10,    11,     4,
     5,     6,     7,    24,    64,    11,     8,    27,     9,    27,
    11,    12,     3,    10,   nil,     4,     5,     6,     7,    34,
    74,    75,     8,    45,     9,   nil,    11,    12,     3,    10,
   nil,     4,     5,     6,     7,    24,    26,   nil,     8,    68,
     9,   nil,    11,    12,     3,    50,   nil,     4,     5,     6,
     7,    24,    49,    25,     8,    26,     9,   nil,    11,    12,
     3,    10,   nil,     4,     5,     6,     7,    24,    26,   nil,
     8,    76,     9,   nil,    11,    12,     3,    10,   nil,     4,
     5,     6,     7,    24,    26,   nil,     8,    78,     9,   nil,
    11,    12,     3,    10,   nil,     4,     5,     6,     7,    24,
    26,   nil,     8,    81,     9,   nil,    11,    12,     3,    10,
   nil,     4,     5,     6,     7,    24,    66,   -36,     8,    32,
     9,   nil,    11,    12,     3,    10,   nil,     4,     5,     6,
     7,    34,   nil,   nil,     8,   nil,     9,   nil,    11,    12,
     3,    10,   nil,     4,     5,     6,     7,    24,   nil,   nil,
     8,   nil,     9,   nil,    11,    12,     3,    10,   nil,     4,
     5,     6,     7,    24,   nil,   nil,     8,   nil,     9,   nil,
    11,    12,     3,    10,   nil,     4,     5,     6,     7,    24,
   nil,   nil,     8,   nil,     9,   nil,    11,    12 ]

racc_action_check = [
     0,     0,    41,     0,     0,     0,     0,     0,    48,    48,
     0,    41,     0,     2,     0,     0,     9,     9,    40,     9,
     9,     9,     9,     9,    33,    40,     9,    33,     9,     3,
     9,     9,    11,    11,     4,    11,    11,    11,    11,    11,
    37,     8,    11,    37,    11,    10,    11,    11,    24,    24,
    12,    24,    24,    24,    24,    24,    42,    25,    24,    42,
    24,    27,    24,    24,    26,    26,    31,    26,    26,    26,
    26,    26,    43,    39,    26,    43,    26,    45,    26,    26,
    28,    28,    46,    28,    28,    28,    28,    28,    51,    62,
    28,    51,    28,    65,    28,    28,    29,    29,    66,    29,
    29,    29,    29,    29,    52,    74,    29,    52,    29,    80,
    29,    29,    30,    30,   nil,    30,    30,    30,    30,    30,
    67,    67,    30,    30,    30,   nil,    30,    30,    32,    32,
   nil,    32,    32,    32,    32,    32,    59,   nil,    32,    59,
    32,   nil,    32,    32,    34,    34,   nil,    34,    34,    34,
    34,    34,    34,     1,    34,     1,    34,   nil,    34,    34,
    35,    35,   nil,    35,    35,    35,    35,    35,    69,   nil,
    35,    69,    35,   nil,    35,    35,    36,    36,   nil,    36,
    36,    36,    36,    36,    72,   nil,    36,    72,    36,   nil,
    36,    36,    44,    44,   nil,    44,    44,    44,    44,    44,
    77,   nil,    44,    77,    44,   nil,    44,    44,    55,    55,
   nil,    55,    55,    55,    55,    55,    55,    50,    55,    50,
    55,   nil,    55,    55,    60,    60,   nil,    60,    60,    60,
    60,    60,   nil,   nil,    60,   nil,    60,   nil,    60,    60,
    64,    64,   nil,    64,    64,    64,    64,    64,   nil,   nil,
    64,   nil,    64,   nil,    64,    64,    70,    70,   nil,    70,
    70,    70,    70,    70,   nil,   nil,    70,   nil,    70,   nil,
    70,    70,    75,    75,   nil,    75,    75,    75,    75,    75,
   nil,   nil,    75,   nil,    75,   nil,    75,    75 ]

racc_action_pointer = [
    -3,   153,    -1,    25,    30,   nil,   nil,   nil,    37,    13,
    29,    29,    40,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    45,    57,    61,    57,    77,    93,
   109,    52,   125,    22,   141,   157,   173,    29,   nil,    59,
     8,    -3,    54,    70,   189,    73,    68,   nil,    -3,   nil,
   203,    86,    93,   nil,   nil,   205,   nil,   nil,   nil,   134,
   221,   nil,    85,   nil,   237,    79,    81,   109,   nil,   166,
   253,   nil,   182,   nil,    88,   269,   nil,   198,   nil,   nil,
    95,   nil ]

racc_action_default = [
   -42,   -43,    -1,   -43,   -43,    -5,    -6,    -7,   -43,   -42,
   -36,   -42,   -43,   -29,   -30,   -31,   -32,   -33,   -34,   -35,
   -37,   -38,   -39,   -40,   -42,   -43,   -42,   -43,   -42,   -42,
   -42,   -16,   -42,   -43,   -42,   -42,   -42,   -43,    82,    -2,
   -17,   -43,   -43,   -43,   -42,   -43,   -25,   -26,   -43,    -9,
   -10,   -43,   -43,   -41,   -18,   -42,    -3,    -4,   -12,   -43,
   -42,    -8,   -43,   -27,   -42,   -23,   -19,   -43,   -13,   -43,
   -42,   -11,   -43,   -21,   -20,   -42,   -14,   -43,   -28,   -22,
   -24,   -15 ]

racc_goto_table = [
     1,    31,    35,    48,    67,    54,   nil,   nil,   nil,   nil,
   nil,    33,   nil,   nil,   nil,   nil,    37,   nil,    39,   nil,
    41,    44,   nil,   nil,    46,   nil,    37,   nil,    52,    42,
    43,    73,   nil,   nil,   nil,    51,   nil,   nil,   nil,    79,
   nil,   nil,   nil,   nil,    59,   nil,   nil,    65,   nil,   nil,
   nil,    70,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    69,   nil,   nil,   nil,    72,   nil,   nil,    80,   nil,   nil,
    77 ]

racc_goto_check = [
     1,     2,     8,     9,    14,    13,   nil,   nil,   nil,   nil,
   nil,     1,   nil,   nil,   nil,   nil,     2,   nil,     2,   nil,
     2,     8,   nil,   nil,     2,   nil,     2,   nil,     2,     1,
     1,    13,   nil,   nil,   nil,     1,   nil,   nil,   nil,    13,
   nil,   nil,   nil,   nil,     1,   nil,   nil,     2,   nil,   nil,
   nil,     8,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     1,   nil,   nil,   nil,     1,   nil,   nil,     2,   nil,   nil,
     1 ]

racc_goto_pointer = [
   nil,     0,    -8,   nil,   nil,   nil,   nil,   nil,    -9,   -31,
   nil,   nil,   nil,   -35,   -51,   nil,   nil ]

racc_goto_default = [
   nil,   nil,     2,    13,    14,    18,    19,    17,   nil,   nil,
    15,    23,    16,    22,   nil,    20,    21 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 20, :_reduce_1,
  3, 20, :_reduce_2,
  4, 22, :_reduce_3,
  4, 23, :_reduce_4,
  1, 24, :_reduce_5,
  1, 25, :_reduce_6,
  1, 26, :_reduce_7,
  3, 27, :_reduce_8,
  2, 27, :_reduce_9,
  1, 28, :_reduce_10,
  3, 28, :_reduce_11,
  4, 29, :_reduce_12,
  5, 29, :_reduce_13,
  6, 29, :_reduce_14,
  7, 29, :_reduce_15,
  2, 30, :_reduce_16,
  3, 31, :_reduce_17,
  4, 31, :_reduce_18,
  5, 31, :_reduce_19,
  6, 31, :_reduce_20,
  6, 31, :_reduce_21,
  7, 31, :_reduce_22,
  1, 33, :_reduce_23,
  3, 33, :_reduce_24,
  3, 34, :_reduce_25,
  3, 32, :_reduce_26,
  4, 32, :_reduce_27,
  6, 35, :_reduce_28,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 21, :_reduce_none,
  3, 21, :_reduce_41,
  0, 21, :_reduce_42 ]

racc_reduce_n = 43

racc_shift_n = 82

racc_token_table = {
  false => 0,
  :error => 1,
  ";" => 2,
  "module" => 3,
  :CONST => 4,
  "end" => 5,
  "class" => 6,
  :STRING => 7,
  :BOOLEAN => 8,
  :NUMBER => 9,
  "(" => 10,
  ")" => 11,
  "," => 12,
  "def" => 13,
  "." => 14,
  "return" => 15,
  "=" => 16,
  "do" => 17,
  "while" => 18 }

racc_nt_base = 19

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
  "BOOLEAN",
  "NUMBER",
  "\"(\"",
  "\")\"",
  "\",\"",
  "\"def\"",
  "\".\"",
  "\"return\"",
  "\"=\"",
  "\"do\"",
  "\"while\"",
  "$start",
  "expList",
  "exp",
  "module",
  "class",
  "string",
  "boolean",
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
    result = [:boolean,val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 18)
  def _reduce_7(val, _values, result)
    result = [:number,val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 21)
  def _reduce_8(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 23)
  def _reduce_9(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 26)
  def _reduce_10(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 28)
  def _reduce_11(val, _values, result)
    result.push(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 31)
  def _reduce_12(val, _values, result)
    result = [:def,[],val[1],[],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 33)
  def _reduce_13(val, _values, result)
    result = [:def,[],val[1],val[2],val[3]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 35)
  def _reduce_14(val, _values, result)
    result = [:def,val[1],val[3],[],val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 37)
  def _reduce_15(val, _values, result)
    result = [:def,val[1],val[3],val[4],val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 40)
  def _reduce_16(val, _values, result)
    result = [:return,val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 43)
  def _reduce_17(val, _values, result)
     result = [:send,val[0],val[2],[]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 45)
  def _reduce_18(val, _values, result)
     result = [:send,val[0],val[2],[],val[3]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 47)
  def _reduce_19(val, _values, result)
     result = [:send,val[0],val[2],[]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 49)
  def _reduce_20(val, _values, result)
     result = [:send,val[0],val[2],val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 51)
  def _reduce_21(val, _values, result)
     result = [:send,val[0],val[2],[],val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 53)
  def _reduce_22(val, _values, result)
     result = [:send,val[0],val[2],val[4],val[6]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 56)
  def _reduce_23(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 58)
  def _reduce_24(val, _values, result)
    result.push(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 61)
  def _reduce_25(val, _values, result)
    result = [:assign,val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 64)
  def _reduce_26(val, _values, result)
    result = [:block,[],val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 66)
  def _reduce_27(val, _values, result)
    result = [:block,val[1],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 69)
  def _reduce_28(val, _values, result)
    result = [:while,val[2],val[4]]
    result
  end
.,.,

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

# reduce 39 omitted

# reduce 40 omitted

module_eval(<<'.,.,', 'SmallRubyParser.y', 84)
  def _reduce_41(val, _values, result)
     result=val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'SmallRubyParser.y', 86)
  def _reduce_42(val, _values, result)
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
