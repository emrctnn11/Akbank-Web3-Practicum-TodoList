// SPDX -License-Identifier: MIT
pragma solidity ^0.8.3;

// Insert, update, read from array of structs

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    // CREATE METHOD
    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    // UPDATE METHOD
    function updateText(uint _index, string calldata _text) external {
        todos [_index].text = _text;
    }

    // GET TO METHOD
    function get(uint _index) external view returns(string memory, bool) {
        // storage gasing 29397 but memory gasing 29480

        Todo storage todo = todos [_index];
        return (todo.text, todo.completed);
    }

    // COMPLETED METHOD
    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

}

