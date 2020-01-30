        oci_budget_budget { 'enterprisemodules (root)/test_budget':
          ensure             => 'present',
          targets            => ['acceptance_tests'],
          amount             => 100.0,
          description        => 'test Budget',
        }
