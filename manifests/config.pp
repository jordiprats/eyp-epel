class epel::config inherits epel {

  if($epel::ensure=='installed')
  {
    #
    # epel
    #

    yumrepo { 'epel':
      enabled => $epel::enable_repo_epel,
    }

    yumrepo { 'epel-debuginfo':
      enabled => $epel::enable_repo_epel_debug,
    }

    yumrepo { 'epel-source':
      enabled => $epel::enable_repo_epel_source,
    }

    #
    # epel-TESTING
    #

    yumrepo { 'epel-testing':
      enabled => $epel::enable_repo_epel_testing,
    }

    yumrepo { 'epel-testing-debuginfo':
      enabled => $epel::enable_repo_epel_testing_debug,
    }

    yumrepo { 'epel-testing-source':
      enabled => $epel::enable_repo_epel_testing_source,
    }
  }
}
