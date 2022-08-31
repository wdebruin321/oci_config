       oci_identity_policy { 'enterprisemodules (root)/test':
          ensure        => 'present',
          description   => 'test_policy',
          statements    => ['Allow group Administrators to manage all-resources in compartment acceptance_tests'],
        }
