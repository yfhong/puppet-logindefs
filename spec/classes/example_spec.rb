require 'spec_helper'

describe 'logindefs' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "logindefs class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('logindefs::params') }
          it { is_expected.to contain_class('logindefs::install').that_comes_before('logindefs::config') }
          it { is_expected.to contain_class('logindefs::config') }
          it { is_expected.to contain_class('logindefs::service').that_subscribes_to('logindefs::config') }

          it { is_expected.to contain_service('logindefs') }
          it { is_expected.to contain_package('logindefs').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'logindefs class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('logindefs') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
