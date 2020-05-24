require 'spec_helper'

on_supported_os.each do |os, os_facts|

  context "On #{os}" do

    describe 'oci_installed_gem fact' do
      subject { Facter.value(:oci_installed_gem) }
      
      before :each do
        # Make sure we're clearing out Facter every time
        Facter.clear
        Facter.clear_messages
        allow(Facter.fact(:kernel)).to receive(:value).and_return(os_facts[:kernel])
      end

      context 'OCI gem is installed' do
        before do
          expect(Facter::Util::Resolution).to \
          receive(:exec).with('/opt/puppetlabs/puppet/bin/gem list oci --local | grep oci')  \
          .and_return('oci (2.8.0)')
        end

        it {is_expected.to eql('2.8.0')}
      end

      context 'OCI gem is not installed' do
        before do
          expect(Facter::Util::Resolution).to \
          receive(:exec).with('/opt/puppetlabs/puppet/bin/gem list oci --local | grep oci')  \
          .and_return('')
        end

        it { is_expected.to eq 'none' }
      end
    end
  end
end