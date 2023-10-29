program wright_quiz.aleo {
    struct String {
        data0: u128,
        data1: u128,
        data2: u128,
        data3: u128,
        data4: u128,
        data5: u128,
        data6: u128,
        data7: u128,
    }

    // Structure for a question in the quiz
    struct Question {
        question_text: String, // 32 chars limit for question text
        correct_answer: u8    // Assuming 4 options (0-3)
    }

    // Store the questions for the quiz
    mapping questions: u8 => Question;
    
    // Record of scores
    mapping user_scores: address => u8;

    // Check if user has already taken the quiz
    mapping user_taken: address => bool;

    mapping temp_scores: address => u8;

    // Add a new question to the quiz
    transition add_question(q_text: String, answer: u8, q_id: u8) {
        return then finalize(q_text, answer, q_id);
    }
    finalize add_question(q_text: String, answer: u8, q_id: u8) {
        let new_question: Question = Question { question_text: q_text, correct_answer: answer };
        Mapping::set(questions, q_id, new_question);
    }

    // Take the quiz
    transition take_quiz(user_address: address, answer: u8, q_id: u8) {
        return then finalize(user_address, answer, q_id);
    }
    
    finalize take_quiz(user_address: address, answer: u8, q_id: u8) {
        let has_taken: bool = Mapping::get_or_use(user_taken, user_address, false);
        assert_eq(has_taken, false);  // Ensure user hasn't taken the quiz before

        let current_question: u8 = Mapping::get_or_use(user_scores, user_address, 0u8);
        assert_eq(current_question, q_id);  // Ensure the question number is correct

        let question: Question = Mapping::get(questions, q_id);
        let score: u8 = Mapping::get_or_use(user_scores, user_address, 0u8);

        if question.correct_answer == answer {
            score += 1u8;
            Mapping::set(user_scores, user_address, score);
        }

        if q_id == 9u8 {
            Mapping::set(user_taken, user_address, true);
        } else {
            Mapping::set(user_scores, user_address, q_id + 1u8);
        }
    }

    // Get the user's score
    transition request_score(user_address: address) {
        return then finalize(user_address);
    }

    finalize request_score(user_address: address) {
        let score: u8 = Mapping::get_or_use(user_scores, user_address, 0u8);
        Mapping::set(temp_scores, user_address, score);
    }
}
