#pragma once

#include <string>

namespace setun {
namespace tools {

class SetunFormatter {
public:
    static std::string format_source(const std::string& source_code);
    static bool format_file(const std::string& file_path, bool in_place = false);
};

} // namespace tools
} // namespace setun
