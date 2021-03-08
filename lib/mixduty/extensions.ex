defmodule Mixduty.Extensions do
  import Mixduty
  @path "extensions"

  @moduledoc """

  """

  @doc """
  List incidents of an account
  #### Example
      Mixduty.Extensions.list(client)
  """
  def list(client, params \\ [], options \\ []) do
    get(@path, client, params, options)
  end

  @doc """
  Create an incident note
  #### Example
      Mixduty.Extensions.create("My Webhook", "PJFWPEP", [%{id: "PIJ90N7", type: "service_reference"}], client)
  """
  def create(
        name,
        extension_schema_id,
        extension_objects,
        client,
        options \\ %{}
      ) do
    extension_body =
      Map.merge(
        %{
          name: name,
          extension_schema: %{
            id: extension_schema_id,
            type: "extension_schema_reference"
          },
          extension_objects: extension_objects
        },
        options
      )

    body = %{extension: extension_body}

    client = Map.put(client, :headers, client.headers)

    post(@path, client, body)
  end

  @doc """
  Update an extension
  #### Example
      Mixduty.Extensions.update("PHFWPEP", "My Webhook", "PJFWPEP", [%{id: "PIJ90N7", type: "service_reference"}], client)
  """
  def update(
        extension_id,
        name,
        extension_schema_id,
        extension_objects,
        client,
        options \\ %{}
      ) do
    extension_body =
      Map.merge(
        %{
          name: name,
          extension_schema: %{
            id: extension_schema_id,
            type: "extension_schema_reference"
          },
          extension_objects: extension_objects
        },
        options
      )

    body = %{extension: extension_body}

    client = Map.put(client, :headers, client.headers)

    @path
    |> Path.join(extension_id)
    |> put(client, body)
  end
end
