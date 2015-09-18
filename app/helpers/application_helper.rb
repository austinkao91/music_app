module ApplicationHelper
  include ERB::Util
  def ugly_lyrics(lyrics)
    tag = "<pre>"
    final = "</pre>"
    string = ""
    string << tag
    lyrics.split("\n").each do |line|
      string << "&#9835"
      string << line
    end
    string << final
    string.html_safe
  end
end
