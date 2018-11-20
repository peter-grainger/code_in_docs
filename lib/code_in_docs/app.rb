require 'redcarpet'

module CodeInDocs

    class CustomRender < Redcarpet::Render::HTML
        def block_code(code, language)
          match = /file\:\/\/(.*)/.match(code).to_s.gsub(/file\:\/\//, '')
          process(match.length > 0 ? File.read(match) :  code)
        end

        def process(code)
            "<pre>" \
            "<code>#{html_escape(code)}</code>" \
            "</pre>"
        end

        def html_escape(string)
            string.gsub(/['&\"<>\/]/, {
              '&' => '&amp;',
              '<' => '&lt;',
              '>' => '&gt;',
              '"' => '&quot;',
              "'" => '&#x27;',
              "/" => '&#x2F;',
            })
          end
    end

    class App
        def main(text = "something")
            markdown = Redcarpet::Markdown.new(CodeInDocs::CustomRender, fenced_code_blocks: true)
            markdown.render(text)
        end
    end
end

CodeInDocs::App.new().main








