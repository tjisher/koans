# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
	raise TriangleError, "Not a Triangle, sides must be positive length" if a < 1 || b < 1 || c < 1
	raise TriangleError, "Not a Triangle, any two sides must add up to more than the third" if (a + b) <= c || ( b + c) <= a || (a + c) <= b

	if a == b
		return :equilateral if b == c
		return :isosceles
	elsif b == c || a == c
		return :isosceles
	end
	:scalene 
  # WRITE THIS CODE
end

def triangle_sorted(a, b, c)
	shortest, mid, longest = [a,b,c].sort #any/all can still equal
	raise TriangleError, "Not a Triangle, sides must be positive length" if shortest < 1
	raise TriangleError, "Not a Triangle, any two sides must add up to more than the third" if (shortest + mid) <= longest

	[:equilateral,:isosceles,:scalene][ ([shortest, mid, longest].uniq.size - 1)]
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
