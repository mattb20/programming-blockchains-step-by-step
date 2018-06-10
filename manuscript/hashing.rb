require 'digest'
hash = Digest::SHA256.hexdigest('Hello Cryptos!');
puts hash
hash = Digest::SHA256.hexdigest(hash);
puts hash

## output of SHA256 will always be 256 bits regardless of the size of the input 
puts Digest::SHA256.hexdigest('I AM LEARNING CRYPTOCURRENCY').length;
