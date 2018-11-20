require 'code_in_docs/app'

describe 'CodeInDocs::app' do
    context "app" do
        app = CodeInDocs::App.new
        it "should render simple markdown" do
            expect(app.main('markdown')).to eq "<p>markdown</p>\n"
        end

        it 'should render normal code block' do
            code = "```ruby\nfoo = \"bar\"\n```"

            puts code
            
            expect(app.main(code)).to eq "<pre><code>foo = &quot;bar&quot;\n</code></pre>"
        end

        it 'should read code from file and put in HTML' do
            code = "```ruby\nfile://spec/code_in_docs/code_example.rb\n```"
            
            expect(app.main(code)).to eq "<pre><code>def foo\n    foo = &quot;bar&quot;\nend</code></pre>"
        end
    end
    
end