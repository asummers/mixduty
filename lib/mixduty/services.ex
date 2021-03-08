defmodule Mixduty.Services do
  import Mixduty
  @path "services"

  @moduledoc """
  A PagerDuty service represents something you monitor (like a web service, email service, or database service). It is a container for related incidents that associates them with escalation policies.

  A service is the focal point for incident management; services specify the configuration for the behavior of incidents triggered on them. This behavior includes specifying urgency and performing automated actions based on time of day, incident duration, and other factors.
  """

  @doc """
  List services
  #### Example
      Mixduty.Services.list(client)
  """
  def list(client, params \\ [], options \\ []) do
    get("#{@path}", client, params, options)
  end

  @doc """
  Create service
  #### Example
      Mixduty.Services.create(client)
  """
  def create(name, escalation_policy, client, options \\ %{}) do
    service_body = %{
      name: name,
      escalation_policy: escalation_policy
    }
    |> Map.merge(options)

    body = %{service: service_body}
    client = Map.put(client, :headers, client.headers) # ++ [{"From", from}])
    post("#{@path}", client, body)
  end

  @doc """
  Create an incident note
  #### Example
      Mixduty.Services.create_integration("My Integration", "events_api_v2_inbound_integration", "P00PBUG", client)
  """
  def create_integration(name, type, service_id, client) do
    body = %{
      integration: %{
        type: type,
        name: name,
        service: %{
          id: service_id,
          type: "service_reference"
        }
      }
    }

    client = Map.put(client, :headers, client.headers)

    @path
    |> Path.join(service_id)
    |> Path.join("integrations")
    |> post(client, body)
  end
end
