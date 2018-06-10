require 'digest'
require 'pp'

class Block
  attr_reader :data
  attr_reader :hash
  attr_reader :nonce ## the mining lottery number

  def initialize(data)
    @data = data
    @nonce, @hash = compute_hash_with_proof_of_work
  end

  def compute_hash_with_proof_of_work(difficulty='00')
      nonce = 0
      loop do
        hash = Digest::SHA256.hexdigest("#{nonce}#{data}");
        if hash.start_with?(difficulty)
          return [nonce,hash] ##provides proof of work if hash starts with leading zeros in difficulty
        else
          nonce += 1
        end
      end
  end
end


## Mine/build some blocks with crypohashes

pp Block.new('This is going to be hashed');
pp Block.new('So is this!!!!');
pp Block.new('So is this!!!!');



## Nonce = Number used ONCE, bitcoin, hash needs to be computed with a set number of leading zeroes,
## The more zeros needed, the harder it is to compute
