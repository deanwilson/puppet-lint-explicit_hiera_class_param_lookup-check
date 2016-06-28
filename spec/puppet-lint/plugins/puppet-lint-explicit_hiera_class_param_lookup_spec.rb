require 'spec_helper'

describe 'explicit_hiera_class_param_lookup' do

  context 'class with no explicit hiera() lookups' do
    let(:code) do
      <<-EOS
        class no_explicit_lookups(
          $my_content = undef
        ) {
          file { '/tmp/foo':
            content => 'bar',
          }
        }
      EOS
    end

    it 'should not detect any problems' do
      expect(problems).to have(0).problems
    end
  end


  context 'class with an explicit hiera() lookup' do
    let(:msg) { "explicit hiera() lookup of my::nested::key" }

    let(:code) do
      <<-EOS
        class no_explicit_lookups(
          $my_content = hiera('my::nested::key', 'baz')
        ) {
          file { '/tmp/foo':
            content => $my_content,
          }
        }
      EOS
    end

    it 'should detect a single problem' do
      expect(problems).to have(1).problem
    end

    it 'should create an error' do
      expect(problems).to contain_error(msg).on_line(2).in_column(31)
    end
  end

end
