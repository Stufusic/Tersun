#pragma once

#include <string>
#include <memory>
#include <optional>
#include <iostream>

namespace setun {

// -----------------------------------------------------------------------------
// Ternary Search Tree (TST): Natural 3-way branching tree for symbol & string lookup
// Uses Balanced Ternary comparison: -1 (Left / Low), 0 (Equal / Middle), +1 (Right / High)
// -----------------------------------------------------------------------------
template <typename ValueType>
class TernarySearchTree {
public:
    struct Node {
        char split_char;
        bool is_end_of_string{false};
        std::optional<ValueType> value{std::nullopt};
        std::unique_ptr<Node> low{nullptr};  // Case -1: char < split_char
        std::unique_ptr<Node> equal{nullptr}; // Case  0: char == split_char
        std::unique_ptr<Node> high{nullptr}; // Case +1: char > split_char

        explicit Node(char c) : split_char(c) {}
    };

    TernarySearchTree() = default;

    void insert(const std::string& key, const ValueType& val) {
        if (key.empty()) return;
        root_ = insert_rec(std::move(root_), key, 0, val);
    }

    std::optional<ValueType> search(const std::string& key) const {
        if (key.empty()) return std::nullopt;
        const Node* node = search_rec(root_.get(), key, 0);
        if (node && node->is_end_of_string) {
            return node->value;
        }
        return std::nullopt;
    }

    bool contains(const std::string& key) const {
        return search(key).has_value();
    }

private:
    std::unique_ptr<Node> root_{nullptr};

    std::unique_ptr<Node> insert_rec(std::unique_ptr<Node> node, const std::string& key, size_t index, const ValueType& val) {
        char c = key[index];
        if (!node) {
            node = std::make_unique<Node>(c);
        }

        // 3-way branching comparison
        if (c < node->split_char) {
            node->low = insert_rec(std::move(node->low), key, index, val);
        } else if (c > node->split_char) {
            node->high = insert_rec(std::move(node->high), key, index, val);
        } else {
            // Character match (Branch 0)
            if (index + 1 < key.size()) {
                node->equal = insert_rec(std::move(node->equal), key, index + 1, val);
            } else {
                node->is_end_of_string = true;
                node->value = val;
            }
        }
        return node;
    }

    const Node* search_rec(const Node* node, const std::string& key, size_t index) const {
        if (!node) return nullptr;
        char c = key[index];

        if (c < node->split_char) {
            return search_rec(node->low.get(), key, index);
        } else if (c > node->split_char) {
            return search_rec(node->high.get(), key, index);
        } else {
            if (index + 1 == key.size()) {
                return node;
            }
            return search_rec(node->equal.get(), key, index + 1);
        }
    }
};

} // namespace setun
