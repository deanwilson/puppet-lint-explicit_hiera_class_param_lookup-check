PuppetLint.new_check(:explicit_hiera_class_param_lookup) do
  def check
    class_indexes.each do |class_idx|

      class_idx[:param_tokens].select { |t|
        t.type == :NAME and t.value == 'hiera'
      }.each do |token|

        next unless token.next_code_token.type == :LPAREN

        hiera_key = token.next_code_token.next_code_token

        notify :error, {
          :message => "explicit hiera() lookup of #{hiera_key.value}",
          :line    => hiera_key.line,
          :column  => hiera_key.column,
        }

      end
    end
  end
end
