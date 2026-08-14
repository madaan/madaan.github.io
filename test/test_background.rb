#!/usr/bin/env ruby
# frozen_string_literal: true

# Drives the shipped homepage markup + stylesheet (not a reimplementation).
root = File.expand_path("..", __dir__)
index = File.read(File.join(root, "index.html"))
styles = File.read(File.join(root, "style.scss"))
compiled_path = File.join(root, "_site/style.css")
compiled = File.exist?(compiled_path) ? File.read(compiled_path) : ""
failures = []

unless index.include?("<details") && index.match?(/<summary>\s*Background\s*<\/summary>/)
  failures << "index.html must ship a details/summary labeled Background"
end

%w[PhD Oracle IIT Bombay SpaceXAI].each do |needle|
  failures << "index.html missing #{needle}" unless index.include?(needle)
end

# Marker must be hidden in the shipped stylesheet.
marker_hidden = styles.include?("summary::-webkit-details-marker") &&
                styles.include?("summary::marker") &&
                styles.match?(/::-webkit-details-marker\s*\{\s*display:\s*none/) &&
                styles.match?(/::marker\s*\{\s*content:\s*""/)
failures << "shipped styles do not hide the details marker" unless marker_hidden

# Closed-state affordance: underline on the summary, not text-decoration: none.
summary_block = styles[/\.background summary[\s\S]*?^\}/]
if summary_block.nil?
  failures << "no .background summary rule in style.scss"
else
  unless summary_block.match?(/text-decoration:\s*underline/)
    failures << "closed Background label has no persistent underline"
  end
  if summary_block.match?(/text-decoration:\s*none/) &&
     !summary_block.match?(/text-decoration:\s*underline/)
    failures << "Background label is text-decoration: none with no other cue"
  end
end

if compiled.include?("::-webkit-details-marker") && compiled.match?(/display:\s*none/)
  # compiled stylesheet also hides the marker
else
  failures << "compiled style.css does not hide details marker" unless compiled.empty?
end

if compiled.match?(/\.background summary[\s\S]{0,400}text-decoration:\s*underline/)
  # ok
elsif !compiled.empty?
  failures << "compiled style.css does not underline .background summary"
end

# Rejected play-arrow / content-based triangle on the summary
if styles.match?(/summary::(before|after)\s*\{[^}]*content:\s*["']▶/) ||
   styles.match?(/summary::(before|after)\s*\{[^}]*content:\s*["']►/)
  failures << "rejected arrow glyph still styled onto Background"
end

if failures.empty?
  puts "OK Background: marker hidden, underline present, copy intact"
  exit 0
end

warn failures.map { |f| "FAIL: #{f}" }.join("\n")
exit 1
