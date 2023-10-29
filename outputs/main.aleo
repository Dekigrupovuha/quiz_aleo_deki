program wright_quiz.aleo;

struct String:
    data0 as u128;
    data1 as u128;
    data2 as u128;
    data3 as u128;
    data4 as u128;
    data5 as u128;
    data6 as u128;
    data7 as u128;

struct Question:
    question_text as String;
    correct_answer as u8;


mapping questions:
	key left as u8.public;
	value right as Question.public;


mapping user_scores:
	key left as address.public;
	value right as u8.public;


mapping user_taken:
	key left as address.public;
	value right as boolean.public;


mapping temp_scores:
	key left as address.public;
	value right as u8.public;

function add_question:
    input r0 as String.private;
    input r1 as u8.private;
    input r2 as u8.private;

    finalize r0 r1 r2;

finalize add_question:
    input r0 as String.public;
    input r1 as u8.public;
    input r2 as u8.public;
    cast r0 r1 into r3 as Question;
    set r3 into questions[r2];


function take_quiz:
    input r0 as address.private;
    input r1 as u8.private;
    input r2 as u8.private;

    finalize r0 r1 r2;

finalize take_quiz:
    input r0 as address.public;
    input r1 as u8.public;
    input r2 as u8.public;
    get.or_use user_taken[r0] false into r3;
    assert.eq r3 false;
    get.or_use user_scores[r0] 0u8 into r4;
    assert.eq r4 r2;
    get questions[r2] into r5;
    get.or_use user_scores[r0] 0u8 into r6;
    is.eq r5.correct_answer r1 into r7;
    add r6 1u8 into r8;
    set r8 into user_scores[r0];
    ternary r7 r8 r6 into r9;
    is.eq r2 9u8 into r10;
    set true into user_taken[r0];
    add r2 1u8 into r11;
    set r11 into user_scores[r0];


function request_score:
    input r0 as address.private;

    finalize r0;

finalize request_score:
    input r0 as address.public;
    get.or_use user_scores[r0] 0u8 into r1;
    set r1 into temp_scores[r0];
