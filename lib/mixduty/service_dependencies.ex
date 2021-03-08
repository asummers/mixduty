defmodule Mixduty.ServiceDependencies do
  import Mixduty
  @path "service_dependencies"

  @moduledoc """

  """

  @doc """
  Create new dependencies between two services.

  #### Example
      Mixduty.ServiceDependencies.associate_service_dependencies([
        %{
            supporting_service: %{
                id: "P7AD56",
                type: "service"
            },
            dependent_service: %{
                id: "P99DJ6",
                type: "business_service"
            }
        },
        %{
            supporting_service: %{
                "id": DT93K1,
                "type": business_service
            },
            dependent_service: %{
                id: "RS34D9",
                type: "service"
            }
        }
    ], client)
  """
  def associate_service_dependencies(relationships, client) do
    body = %{relationships: relationships}

    client = Map.put(client, :headers, client.headers)

    post("#{@path}/associate", client, body)
  end

  @doc """
  Disassociate dependencies between two services.

  #### Example
      Mixduty.ServiceDependencies.disassociate_service_dependencies([
        %{
            supporting_service: %{
                id: "P7AD56",
                type: "service"
            },
            dependent_service: %{
                id: "P99DJ6",
                type: "business_service"
            }
        },
        %{
            supporting_service: %{
                "id": DT93K1,
                "type": business_service
            },
            dependent_service: %{
                id: "RS34D9",
                type: "service"
            }
        }
    ], client)
  """
  def disassociate_service_dependencies(relationships, client) do
    body = %{relationships: relationships}

    client = Map.put(client, :headers, client.headers)

    post("#{@path}/disassociate", client, body)
  end

  @doc """
  List service dependencies of a business service
  #### Example
      Mixduty.ServiceDependencies.business_service_dependencies("P00PBUG", client)
  """
  def business_service_dependencies(business_service_id, client, params \\ [], options \\ []) do
    @path
    |> Path.join("business_services")
    |> Path.join(business_service_id)
    |> get(client, params, options)
  end

  @doc """
  List service dependencies of a technical service
  #### Example
      Mixduty.ServiceDependencies.technical_service_dependencies("P00PBUG", client)
  """
  def technical_service_dependencies(technical_service_id, client, params \\ [], options \\ []) do
    @path
    |> Path.join("technical_services")
    |> Path.join(technical_service_id)
    |> get(client, params, options)
  end
end
