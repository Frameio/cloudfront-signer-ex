use Mix.Config

config :cloudfront_signer, CloudfrontSignerTest,
  domain: "https://somewhere.cloudfront.com",
  key_pair_id: "a_key_pair",
  private_key: """
"""