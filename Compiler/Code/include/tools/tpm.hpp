#pragma once

#include <string>
#include <vector>
#include <map>

namespace setun {

// -----------------------------------------------------------------------------
// TPM: Ternary Package Manager for Setun-70 Ecosystem (Module 5)
// -----------------------------------------------------------------------------
struct PackageManifest {
    std::string name{"my_project"};
    std::string version{"1.0.0"};
    std::string author{"Developer"};
    std::string main_file{"main.taf"};
    std::string output_binary{"out.tbc"};
    std::vector<std::string> dependencies;

    static PackageManifest parse_toml(const std::string& content);
    std::string generate_toml() const;
};

class TernaryPackageManager {
public:
    static int cmd_init(const std::string& proj_name);
    static int cmd_build(const std::string& manifest_path = "setun.toml");
    static int cmd_test(const std::string& manifest_path = "setun.toml");
};

} // namespace setun
