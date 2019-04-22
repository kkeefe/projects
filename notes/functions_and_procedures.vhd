-- things to do with asserting conditions. these bad bois can be useful
-- since VHDL 2008 functions and procedures are allowed to have generic lists
-- in procedures and functions which you will find below..

------- Examples of Assert -------

-- Syntax:

-- conditional assert statement:
-- note that any assert statement can have different severity levels, inc "Note"
assert sig1 = sig2 report "make sure that the signal values are equal"
  severity warning;



-- unconditional assert statement:


-- Uses:


-- assert statements are useful to enforce certain conditions during simulation
-- or synthesis.. assert statements can also be used in conditional / sequential code.


-- a useful attribute is the T'image(val). 'image attribute will report the string
-- rep of the value passed to it which can then be reported in the string output
-- of the assert statement..

-- TO_STRING is also a valid type-conversion function which accepts slv's, etc..




------- Examples of functions -------

-- functions are labeled either pure / impure (default is pure)
-- impure functions can modify their input values.

-- functions require some input list [ inp1 , inp2 , .. ]

-- the return can be any type, but will always be ONE returned value


-- Alias

-- function declaration
-- name
function func1(
  -- input signals
  signal signal_1 : std_logic;
  signal sig_2    : std_logic)
  -- return type specified                                       
  return std_logic;


-- function definition
-- purpose: take some simple outputs and do some easy things with them!
function func1 (
  signal signal_1 : std_logic;
  signal sig_2    : std_logic)
  return std_logic is
-- [declarative part] : may include variables here..

begin  -- function func1

end function func1;



------- Examples of Procedures -------

-- Main use and difference from a function: more than 1 return value..                                             

-- default values:
-- -> IN : const
-- -> OUT : variable                                             


-- Declaration of the procedure..
procedure procedure_1 (
  signal inp1   : in  std_logic;        -- input_val_1
  signal out1 : out std_logic);       -- output_val_1


-- Definition of the procedure..
-- purpose: when given some inputs produce these kinds of outputs..
procedure procedure_1 is

begin  -- procedure procedure_1

end procedure procedure_1;


------- Overloading of Operators -------

