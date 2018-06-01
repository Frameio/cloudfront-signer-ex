defmodule CloudfrontSigner.Signature do
  @moduledoc """
  Manages policy signing
  """
  alias CloudfrontSigner.Policy

  @whitespace ~r/\s+/

  @doc """
  Converts a `Policy.t` struct to a cloudfront signature for the given private key
  """
  @spec signature(Policy.t, tuple) :: binary
  def signature(%Policy{} = policy, private_key) do
    :crypto.hash(:sha, Policy.to_string(policy))
    |> :public_key.encrypt_private(private_key)
    |> String.replace(@whitespace, "")
    |> Base.encode64()
    |> String.replace("+", "-")
    |> String.replace("=", "_")
    |> String.replace("/", "~")
  end
end