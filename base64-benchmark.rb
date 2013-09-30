require 'benchmark'
require 'base64'
require 'pry-debugger'

def noise(max)
  (0...max).map{ ('A'..'z').to_a[rand(42)] }.join
end
small = noise(10_000)
medium = noise(100_000)
large = noise(1_000_000)

puts 'encode64'
Benchmark.bm do |b|
  b.report("small: ") { Base64.encode64(small) }
  b.report("medium: ") { Base64.encode64(medium) }
  b.report("large: ") { Base64.encode64(large) }
end

small_encoded = Base64.encode64(small)
medium_encoded = Base64.encode64(medium)
large_encoded = Base64.encode64(large)

puts 'decode64'
Benchmark.bm do |b|
  b.report("small: ") { Base64.decode64(small_encoded) }
  b.report("medium: ") { Base64.decode64(medium_encoded) }
  b.report("large: ") { Base64.decode64(large_encoded) }
end

puts 'strict_encode'
Benchmark.bm do |b|
  b.report("small: ") { Base64.strict_encode64(small) }
  b.report("medium: ") { Base64.strict_encode64(medium) }
  b.report("large: ") { Base64.strict_encode64(large) }
end

small_encoded = Base64.strict_encode64(small)
medium_encoded = Base64.strict_encode64(medium)
large_encoded = Base64.strict_encode64(large)

puts 'strict_decode'
Benchmark.bm do |b|
  b.report("small: ") { Base64.strict_decode64(small_encoded) }
  b.report("medium: ") { Base64.strict_decode64(medium_encoded) }
  b.report("large: ") { Base64.strict_decode64(large_encoded) }
end

puts 'urlsafe_encode'
Benchmark.bm do |b|
  b.report("small: ") { Base64.urlsafe_encode64(small) }
  b.report("medium: ") { Base64.urlsafe_encode64(medium) }
  b.report("large: ") { Base64.urlsafe_encode64(large) }
end

small_encoded = Base64.urlsafe_encode64(small)
medium_encoded = Base64.urlsafe_encode64(medium)
large_encoded = Base64.urlsafe_encode64(large)

puts 'urlsafe_decode'
Benchmark.bm do |b|
  b.report("small: ") { Base64.urlsafe_decode64(small_encoded) }
  b.report("medium: ") { Base64.urlsafe_decode64(medium_encoded) }
  b.report("large: ") { Base64.urlsafe_decode64(large_encoded) }
end
