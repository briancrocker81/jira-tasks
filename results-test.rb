sample_results = [
  'feature/FLX-1111-aaaaa-aaaaa-aaa-aa',
  'feature/FLX-2222-bbbbb-bbb-bb-bbbbb-bbb',
  'feature/FLX-3333-cccccc-c-c-c-c-c-cccc',
  'bugfix/FLX-4444-dddddd-ddd-dddd-ddd-dd',
  'bugfix/FLX-5555-eeeee-eeee-ee'
]

def parse_results(sample_results)
  i = 1
  sample_results.each do |r|
    puts "#{i}: #{r}"
    i += 1
  end

end

parse_results(sample_results)
