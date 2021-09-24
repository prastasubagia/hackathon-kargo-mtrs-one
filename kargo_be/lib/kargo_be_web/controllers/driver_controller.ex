defmodule KargoBeWeb.DriverController do
  use KargoBeWeb, :controller

  alias KargoBe.Drivers
  alias KargoBe.Drivers.Driver

  action_fallback KargoBeWeb.FallbackController

  def index(conn, _params) do
    drivers = Drivers.list_drivers()
    render(conn, "index.json", drivers: drivers)
  end

  # def handle_images(driver_params) do
  #   img_path = Path.expand("priv/static/images")
  #   localhost = "http://localhost:4000/static/images/";
  #   phone_number = Map.get(driver_params,"phone_number")

  #   id_card = Map.get(driver_params,"id_card")
  #   driver_license = Map.get(driver_params,"driver_license")

  #   driver_params = %{driver_params |
  #   "id_card"=>
  #     if id_card != nil do
  #       id_card_path = img_path <> "/id_card-" <> phone_number <> ".jpg"
  #       id_card_url = localhost <> "id_card-" <> phone_number <> ".jpg"
  #       {start, length} = :binary.match(id_card, ";base64,")
  #       raw = :binary.part(id_card, start + length, byte_size(id_card) - start - length)
  #       File.write!(id_card_path, Base.decode64!(raw))
  #       id_card_url
  #     else
  #       nil
  #     end,
  #   "driver_license"=>
  #     if driver_license != nil do
  #       driver_license_path = img_path <> "/driver_license-" <> phone_number <> ".jpg"
  #       driver_license_url = localhost <> "driver_license-" <> phone_number <> ".jpg"
  #       {start, length} = :binary.match(driver_license, ";base64,")
  #       raw = :binary.part(driver_license, start + length, byte_size(driver_license) - start - length)
  #       File.write!(driver_license_path, Base.decode64!(raw))
  #       driver_license_url
  #     else
  #       nil
  #     end
  #   }
  #   driver_params
  # end

  def create(conn, %{"driver" => driver_params}) do
    img_path = Path.expand("priv/static/images")
    localhost = "http://localhost:4000/static/images/";
    phone_number = Map.get(driver_params,"phone_number")

    id_card = Map.get(driver_params,"id_card")
    driver_license = Map.get(driver_params,"driver_license")

    driver_params = %{driver_params |
    "id_card"=>
      if id_card != nil do
        id_card_path = img_path <> "/id_card-" <> phone_number <> ".jpg"
        id_card_url = localhost <> "id_card-" <> phone_number <> ".jpg"
        {start, length} = :binary.match(id_card, ";base64,")
        raw = :binary.part(id_card, start + length, byte_size(id_card) - start - length)
        File.write!(id_card_path, Base.decode64!(raw))
        id_card_url
      else
        nil
      end,
    "driver_license"=>
      if driver_license != nil do
        driver_license_path = img_path <> "/driver_license-" <> phone_number <> ".jpg"
        driver_license_url = localhost <> "driver_license-" <> phone_number <> ".jpg"
        {start, length} = :binary.match(driver_license, ";base64,")
        raw = :binary.part(driver_license, start + length, byte_size(driver_license) - start - length)
        File.write!(driver_license_path, Base.decode64!(raw))
        driver_license_url
      else
        nil
      end
    }

    with {:ok, %Driver{} = driver} <- Drivers.create_driver(driver_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.driver_path(conn, :show, driver))
      |> render("show.json", driver: driver)
    end
  end

  def show(conn, %{"id" => id}) do
    driver = Drivers.get_driver!(id)
    render(conn, "show.json", driver: driver)
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    # img_path = Path.expand("priv/static/images")
    # localhost = "http://localhost:4000/static/images/";
    # phone_number = Map.get(driver_params,"phone_number")

    # id_card = Map.get(driver_params,"id_card")
    # driver_license = Map.get(driver_params,"driver_license")

    # driver_params = %{driver_params |
    # "id_card"=>
    #   if id_card != nil do
    #     id_card_path = img_path <> "/id_card-" <> phone_number <> ".jpg"
    #     id_card_url = localhost <> "id_card-" <> phone_number <> ".jpg"
    #     {start, length} = :binary.match(id_card, ";base64,")
    #     raw = :binary.part(id_card, start + length, byte_size(id_card) - start - length)
    #     File.write!(id_card_path, Base.decode64!(raw))
    #     id_card_url
    #   else
    #     nil
    #   end,
    # "driver_license"=>
    #   if driver_license != nil do
    #     driver_license_path = img_path <> "/driver_license-" <> phone_number <> ".jpg"
    #     driver_license_url = localhost <> "driver_license-" <> phone_number <> ".jpg"
    #     {start, length} = :binary.match(driver_license, ";base64,")
    #     raw = :binary.part(driver_license, start + length, byte_size(driver_license) - start - length)
    #     File.write!(driver_license_path, Base.decode64!(raw))
    #     driver_license_url
    #   else
    #     nil
    #   end
    # }

    driver = Drivers.get_driver!(id)

    with {:ok, %Driver{} = driver} <- Drivers.update_driver(driver, driver_params) do
      render(conn, "show.json", driver: driver)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = Drivers.get_driver!(id)

    with {:ok, %Driver{}} <- Drivers.delete_driver(driver) do
      send_resp(conn, :no_content, "")
    end
  end
end
