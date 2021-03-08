defmodule Mixduty.BusinessServices do
  import Mixduty
  @path "business_services"

  @moduledoc """
  Business Services model capabilities that span multiple technical Services and that may be owned by several different teams.

  Mapping technical Services to Business Services gives responders context on an Incident’s impact to the business.
  """

  @doc """
  List bsuiness services
  #### Example
      Mixduty.BusinessServices.list(client)
  """
  def list(client, params \\ [], options \\ []) do
    get("#{@path}", client, params, options)
  end

  @doc """
  Create business service
  #### Example
      Mixduty.BusinessServices.create("My Service", client)
  """
  def create(name, client, options \\ %{}) do
    business_service_body = %{
      name: name
    }
    |> Map.merge(options)

    body = %{business_service: business_service_body}
    client = Map.put(client, :headers, client.headers)
    post("#{@path}", client, body)
  end
end
