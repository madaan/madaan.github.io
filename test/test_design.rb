#!/usr/bin/env ruby
# frozen_string_literal: true

# Structural checks against the shipped Jekyll source — not a reimplementation.
require "json"

root = File.expand_path("..", __dir__)
failures = []

def read(path)
  File.read(path)
end

variables = read(File.join(root, "_sass/_variables.scss"))
styles = read(File.join(root, "style.scss"))
layout = read(File.join(root, "_layouts/default.html"))
index = read(File.join(root, "index.html"))
compiled = File.join(root, "_site/style.css")
compiled_css = File.exist?(compiled) ? read(compiled) : ""

# Rejected looks must not ship.
forbidden = {
  "cream paper" => "#f3efe6",
  "rust accent" => "#9a4324",
  "gray band paper" => "#f7f7f7",
  "default-blue links" => "#1a56c4",
  "navy chrome" => "#1a1a2e",
}

forbidden.each do |name, token|
  [variables, styles, compiled_css].each do |src|
    next if src.empty?
    if src.include?(token)
      failures << "rejected token #{token} (#{name}) still present"
    end
  end
end

if styles.match?(/#main[^{]*\{[^}]*justify-content:\s*center/) ||
   styles.include?("#main:has(.profile-section)")
  failures << "homepage wrapper is vertically centered (causes Background jump)"
end

if variables.include?('"Inter"') || layout.include?("family=Inter")
  failures << "Inter-only type stack is still shipped"
end

unless variables.include?("IBM Plex Serif") && variables.include?("IBM Plex Sans")
  failures << "expected IBM Plex type pairing in _variables.scss"
end

unless layout.include?("IBM+Plex+Serif") && layout.include?("IBM+Plex+Sans")
  failures << "default layout does not load IBM Plex"
end

if layout.include?("wrapper-masthead") || layout.match?(/background:\s*#1a1a2e/)
  failures << "navy chrome wrapper still in default layout"
end

# Required homepage content (shipped index.html).
required = [
  "I work at",
  "SpaceXAI",
  "improving the utility and capability of language models",
  "Background",
  "PhD",
  "Oracle",
  "IIT Bombay",
  'src="/res/artifacts/dp.jpg"',
]

required.each do |needle|
  failures << "index.html missing #{needle.inspect}" unless index.include?(needle)
end

unless index.include?("<details") && index.include?("<summary>Background</summary>")
  failures << "Background must be a native details/summary disclosure"
end

unless layout.include?("/blog") && layout.include?("Blog")
  failures << "Blog header link missing from default layout"
end

if failures.empty?
  puts "OK #{required.size} content checks, rejected tokens absent, no vertical centering"
  exit 0
end

warn failures.map { |f| "FAIL: #{f}" }.join("\n")
exit 1
