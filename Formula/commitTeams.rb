class Committeams < Formula
  desc "Interactive Git commit message generator for teams with custom templates"
  homepage "https://github.com/xpmxf4/homebrew-committeams"
  url "https://github.com/xpmxf4/homebrew-committeams/raw/main/commitTeams.sh"
  version "1.0.0"
  sha256 "91e0bd1c22b070f0c9fa5189b2a9b82fa59d46fecf174a43256a0ad83eb3e0fd"

  def install
    bin.install "commitTeams.sh" => "commitTeams"
  end
end

