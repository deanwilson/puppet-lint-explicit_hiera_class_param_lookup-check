require 'spec_helper'

describe 'explicit_hiera_class_param_lookup' do
  context 'class with no explicit hiera() lookups' do
    let(:code) do
      <<-TEST_CLASS
        class no_explicit_lookups(
          $my_content = undef
        ) {
          file { '/tmp/foo':
            content => 'bar',
          }
        }
      TEST_CLASS
    end

    it 'does not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'class with an explicit hiera() lookup' do
    let(:msg) { 'explicit hiera() lookup of my::nested::key' }

    let(:code) do
      <<-TEST_CLASS
        class no_explicit_lookups(
          $my_content = hiera('my::nested::key', 'baz')
        ) {
          file { '/tmp/foo':
            content => $my_content,
          }
        }
      TEST_CLASS
    end

    it 'detects a single problem' do
      expect(problems).to have(1).problem
    end

    it 'creates an error' do
      expect(problems).to contain_error(msg).on_line(2).in_column(31)
    end
  end

  ### Reported issues
  context 'empty class with inherit and no explicit hiera() lookups' do
    let(:code) do
      <<-TEST_CLASS
        class ig::base::freebsd inherits ig::base { }
      TEST_CLASS
    end

    it 'does not detect any problems' do
      expect(problems).to have(0).problems
    end
  end
end
