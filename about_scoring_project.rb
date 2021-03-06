require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
	score = 0
	numberOf1s = 0
	numberOf2s = 0
	numberOf3s = 0
	numberOf4s = 0
	numberOf5s = 0
	numberOf6s = 0
	
	if dice != []
		dice.each do |item|
			if item == 1
				numberOf1s=numberOf1s+1
			end
			if item == 2
				numberOf2s=numberOf2s+1
			end
			if item == 3
				numberOf3s=numberOf3s+1
			end
			if item == 4
				numberOf4s=numberOf4s+1
			end
			if item == 5
				numberOf5s=numberOf5s+1
			end
			if item == 6
				numberOf6s=numberOf6s+1
			end
		end
		
		if numberOf1s >= 3
			score += (numberOf1s/3)*1000
			score += numberOf1s%3 *100
		else
			score += numberOf1s *100
		end

		if numberOf2s >= 3
			score += (numberOf2s/3)*200
		end
	
		if numberOf3s >= 3
			score += (numberOf3s/3)*300
		end
	
		if numberOf4s >= 3
			score += (numberOf4s/3)*400
		end

		if numberOf5s >= 3
			score += (numberOf5s/3)*500
			score += numberOf5s%3 *50
		else
			score += numberOf5s * 50
		end
		
		if numberOf6s >= 3
			score += (numberOf6s/3)*600
		end
	
	end	
	return score
end

class AboutScoringProject < Neo::Koan

  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end
  
  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end
