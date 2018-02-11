function changelog {
    $t = git describe --tags --abbrev=0
    git log "$t...HEAD" --oneline
  }
  
  function edittips {
    code C:\code\POSH-Tips\POSHTips.json
  }
  
  function editprofile {
    code C:\code\personal-powershell-profile
  }  