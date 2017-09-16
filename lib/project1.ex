defmodule Project1 do
  @moduledoc """
  Documentation for Project1.
  """

  def bitcoingen(zerolead) do
    k = zerolead
    substr = ""
    substr = createzero(k,substr)
    i = 1;
    input_left = "rahulp248;"
    input_right = :crypto.strong_rand_bytes(6) |> Base.encode64
    start = input_left <> input_right 
    inter = start
    keygen(k,start,inter,i,substr)
    bitcoingen(zerolead)
  end

  def createzero(k,substr) do
    if(k>0) do
      substr = substr <> "0"
      createzero(k-1, substr)
    else 
      substr
    end
  end

  def keygen(k,start,inter,i,substr) do
    val = :crypto.hash_init(:sha256)
    val = :crypto.hash_update(val,inter)
    val_bin = :crypto.hash_final(val)
    val_hex = val_bin |> Base.encode16 |> String.downcase
    if(String.slice(val_hex,0,k) == substr) do
      IO.puts "#{start}\t#{val_hex}"
    else
      inter = inter <> Integer.to_string(i)
      keygen(k,start,inter,i+1,substr)
    end
  end
end
