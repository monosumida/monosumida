class CustomMarkdownRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
  # Override a method from Rouge::Plugins::Redcarpet
  # Add language section above code block.
  def block_code(code, language)

    # --- Extract file name ---------------------- #
    filename = ''
    regx = Regexp.new(/(<!--\s?filename:(\s?.{1,}\s?)-->\n?)/)
    if !(code =~ regx).nil?
      code.match(regx)
      filename = $2.try(:strip) || ''
      code.gsub!(regx, '')
    end
    # -------------------------------------------- #

    lexer = Rouge::Lexer.find_fancy(language, code) || Rouge::Lexers::PlainText
    if lexer.tag == 'make'
      code.gsub! /^    /, "\t"
    end
    formatter = rouge_formatter(lexer)
    result = formatter.format(lexer.lex(code))

    return result if language.blank? && filename.blank?

    # --- Compose language and filename section --- #

    info_inner_html = [filename, language].select(&:present?).map.with_index { |text, i|
      i == 0 ? "<span class='highlight-info__inner'>#{text}</span>" : nil
    }.compact.join('')

    %(<div class='highlight-info'>
        #{info_inner_html}
      </div>
      #{result}
    )
    # -------------------------------------------- #
  end

  def rouge_formatter(options = {})
    options = {
      line_numbers: true,
      line_format: '<span>%i</span>'
    }
    Rouge::Formatters::HTMLLegacy.new(options)
  end
end
