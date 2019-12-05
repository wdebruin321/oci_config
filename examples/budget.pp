        oci_budget_budget { 'enterprisemodules (root)/test_budget':
          ensure             => 'present',
          target_compartment => 'acceptance_tests',
          amount             => 100.0,
          description        => 'test Budget',
        }
