![alt text](imgs/aleo-quiz.png "quiz")

# Notepad Smart Contract on Aleo
[![Follow me on Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/DekiDima)
[![Discord: @dmitrydeki](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)](@dmitrydeki)
[![Me on Telegram](https://img.shields.io/badge/Telegram-%235865F2.svg?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/dmitrydeki)

# deki_quiz: A Simple Quiz Smart Contract on Aleo

## Overview

`wright_quiz` is a smart contract built on the Aleo platform, which provides a basic quiz game functionality. The contract allows users to add questions to a quiz, take the quiz, and then request their score.

## Structures

- **String**:
  - A custom string representation that holds up to 32 characters.
  - Each `u128` field can store a segment of the string.

- **Question**:
  - Represents a question in the quiz.
  - `question_text`: The text of the question, up to 32 characters.
  - `correct_answer`: The correct answer index (0-3).

## Functionalities

### 1. Add a new question:

Allows users to add a new question to the quiz.

**Inputs**:
- `q_text`: The question text wrapped in the custom `String` structure.
- `answer`: The correct answer index (0-3).
- `q_id`: A unique identifier for the question.

### 2. Take the quiz:

Allows a user to take a question from the quiz.

**Inputs**:
- `user_address`: The Aleo address of the user.
- `answer`: User's chosen answer index (0-3).
- `q_id`: The ID of the question being answered.

### 3. Request score:

Allows a user to request their score for the quiz.

**Inputs**:
- `user_address`: The Aleo address of the user.

## Sample Inputs:

Here's a sample of how to structure the inputs for each transition:

```plaintext
[add_question]
new_note: String = String { data0: 1231234u128, data1: 12312313u128, data2: 0u128, ... };
answer: u8 = 1u8;
q_id: u8 = 1u8;

[take_quiz]
user_address: address = aleo1875942p6nxagsxrd4kj0cx3yeg8undscgc60vlvsazfdudpxeggqp8hr5v;
answer: u8 = 1u8;
q_id: u8 = 1u8;

[request_score]
user_address: address = aleo1875942p6nxagsxrd4kj0cx3yeg8undscgc60vlvsazfdudpxeggqp8hr5v;
```

## Conclusion

`deki_quiz` is a basic quiz game on the Aleo platform. Users can interact with the contract by adding questions, taking the quiz, and requesting their score. This contract provides a simple demonstration of Aleo's capabilities for building decentralized applications with user interactions.
