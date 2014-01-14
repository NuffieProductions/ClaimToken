def restore_default_config
  ClaimToken.configuration = nil
  ClaimToken.configure {}
end
