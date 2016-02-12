http://rubykoans.com
https://github.com/bbatsov/ruby-style-guide/blob/master/README.md

1_000_000 = 1000000

about_asserts
assert_equal > assert

about_nil
nil is a Object

about_objects
!= will not match clones

about_arrays
array[-1,1], [0..2], remember -1 is last element not one in from end
Range (1..3) == (1...4) ie witht 3 dots end value is excluded
pop from end
shift remove first, expensive of course, unshift adds to front

about_array_assignment
first_name, last_name = ["John", "Smith", "Ignored"]
* (or splat) makes [] into argument list for methods
** can be used on Hashes to pass key and value
first_name, = ["John", "Smith"] is valid but I'd still call it insane

about_hashes
{key: "value"} prefered over {:key => "value"} but not mix
hash.fetch(:key) instead of hash[:key] if want exception rather than nil
#todo# style guide says use key: but doesnt comapre  {"f" => 1} != {"f": 1}
Hash.new("value ie for not populated or found keys, 1 single object across all keys")
#todo# review test_default_value_with_block passing hash as default value makes them seperate objects

about_strings
"string" 'string' "\"string\"" %(string) %{string} %!string!
%() etc are multine, auto include \n's, .lines accesible inc .lines.count, length/size includes \n's etc 
<<EOS 
string
EOS  entry starts/line count starts on 2nd line
multi line string concatination "\" can be used with quoted strings
string += second_half is acceptable but "#{user.name} <#{user.email}>" or format('%s <%s>', user.name, user.email) prefered
remember += returns new object
'\n' single quote no specical charaters, usually. + no evaluation ie no '#{string}'
?a single character, use because reasons, used to return int representation
string.split defaults to splitting on space

about_symbols
:symbol == (a = :symbol) ie even when object assigned
Symbol.all_symbols.map { |x| x.to_s } good old map/array/hash to string
lam = lambda  { |a, b| a + b } \n lam.call(1,2)
variable with capital first letter become Constants, which are also symbols
:string == "string".to_sym, can also include spaces because reasons, also :"a #{b} c"
:string.to_s == "string"
.respond_to?(:each_char) check for method

about_regex
/pattern/
return first matched content or nil
after patten can number which group to return ie "Gary" == "Gray, James"[/(\w+), (\w+)/, 1]
$1 $2 etc will remain matched groups until next pattern is performed, ie can use next line
.scan( /pattern/) return array ie find_all
.sub /pattern/ = find_replace, gsub is global version find_replace_all

about_methods
def method_with_defaults(a, b=:default_value)
def stub; end
self. == c#this.
private :my_private_method, same with protected, after method defined or list below declaration as:
private
def my_private_method
self. cannot call private methods because reasons
assert_raise(NoMethodError) do
  klass.private_method
end

about_keyword_arguments
def method_with_keyword_arguments(one: 1, two: 'two') w/ defaults
def method_with_keyword_arguments(one, two: 'two') no default

about_constants
::GlobalObj
Scope::LocalObj
Constants are inherited into nested classes
nested constants take president over inherited ones, unless of course namespace seperately

about_control_statmenets
ie bad loop examples
for x in array; x.to_s; end
.upcase, .capitalize, .downcase
10.times do; x += y; end;

about_true_and_false
as usual everything true apart from false, and nil though

about_triangle_project (1)
plenty to discuss, alt path is to array/sort though much more expensive (91.1% faster)

about_exceptions
    begin
      #something
    rescue StandardError
      #catch
    ensure
      #always
    end


about_triangle_project (2)
"Any two sides of a triangle should add up to more than the third side."
line length too long but kept relevant, performance over array still over 75%
still no data type check

about_iteration
    array.each do |item|
      sum += item
    end
    var = array.each { |item| sum += item }
    varArray = array.collect { |item| item + 1 } ==  array.map { |item| item + 1 }
    array.select/find_all { |item| (item % 2) == 0 }, for nested if
.find returns first
	[2, 3, 4].inject(0) { |sum, item| sum + item }
inject, throws the param into the first(sum) element or first element of collection if no param (2)
	can use it continue counting ie make non zero based, convert array of arrays to hash or vice versa
	[[:first_name, 'Shane'], [:last_name, 'Harvie']].inject({}) do |result, element|

about_blocks
yields are a thing and apparently popular, yuck, implicit unreferenced invoktion
	allows the passed block freedom and the consumer to not care about specifics
	varibales given still apply in orignal scope, ie byRef not Val
add_one = lambda { |n| n + 1 }, add_one.call(10) == add_one[10]
def method(&i_want_a_block); end, method(&heres_a_block)

about_sandwhich_code
prep, executre, close || bread, meat, bread
means to abstract out repeated and consistent intro/outros
ensure applies to classes and modules as well as usual try blocks

about_scoring_project
val.between?(1,5)
score_long is 10% faster than score (ie lots of counting in small array is inexpensive)
#todo# review ||= in style guides, single line value/count should be legible

about_classes
@local_var, can be defined implicitly in a method
klass.instance_variable_get("@inaccesible_var"), with no thrown exception, doesnt mean you should
attr_reader :name
attr_accessor :name
.to_s auto called, unsiprisngly, along with .inspect should be implemented
"\"STRING\"" == "STRING".inspect, becuase reasons

about_open_classes
defining a class a second time does not replace but instead extends
test_dice_values_should_change_between_rolls: either a test of the pRNG seed, pRNG in general or object reuse
  object reuse is the easiest and quickest to test, seed is cheap, pRNG in general is incredibly expensive though reduce likelyhood is possible

about_inheritence
.super refers to parent method not class ie cant use to call a different method
method(:foo).super_method.call is possible however
which is dumb

about_modules
non-instatnceable method/constant stores, principly for inheritance, can reference @val's it of course doesnt have (yet)
namespacing

about_scope
::GlobalThing
Namespace::OtherThing

about_class_methods
can assign methods to classes without def class; end, just dot notation instance.new_method; end, only affects given instance
def class.new_method; end, non-instances methods singleton
class are same as methods w/ implicit return of last statement, becuase reasons

about_message_passing
class.send( :method_name, :first_arg, :second_arg), bool class.respond_to?(:method_name)
always remeber lcase is not opposite to upcase, its downcase becuase reasons
[].join(", ")
class.method_missing can be defined ie def method_missing(method_name, *args, &block);
string[1,3] == range
if overridng missing_method should also override respond_to? appropiately

about_proxy_object_project
pro-tip dont spell methods the wrong name
remember attr_reader :object use labels not 'object'
[].include? x, [].count x

about_to_str
implement to_str for aid but where cannot be practically treated as a string
to_s remains the standard so long as output is equivilant to the object