defmodule Braintree.MerchantAccount do
  @moduledoc """
  Find merchant account by id

  # TODO add support for all, create, & update
  """
  use Braintree.Construction

  alias Braintree.{
    ErrorResponse,
    HTTP
  }

  @type t :: %__MODULE__{
    status: String.t
  }

  defstruct status: nil

  @doc """
  Finds merchant account by the account id passed in.

  ## Example

    {:ok, merchant_account} = Braintree.MerchantAccount.find(account_id)
    {:error, Error.t} = Braintree.MerchantAccount.find(invalid_id)
  """
  @spec find(String.t) :: {:ok, t} | {:error, ErrorResponse.t}
  def find(account_id, opts \\ []) do
    path = "merchant_accounts/" <> account_id

    with {:ok, %{"merchant_account" => map}} <- HTTP.get(path, opts) do
      {:ok, new(map)}
    end
  end
end