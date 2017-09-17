defmodule Project1 do
  @moduledoc """
  Documentation for Project1.
  """

  #def main(zerolead) do
  #  k = Enum.at(zerolead,0) |> String.trim
  #  if String.contains?(k,".") do
  #    IO.puts "hello"
  #  else
  #    k = k |> String.to_integer
  #    multitask(k)
  #  end
  #end

  def main(zerolead) do
    pid1 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid1, {pid1,zerolead})
    pid2 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid2, {pid2,zerolead})
    pid3 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid3, {pid3,zerolead}) 
    pid4 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid4, {pid4,zerolead})
    pid5 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid5, {pid5,zerolead})
    pid6 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid6, {pid6,zerolead})
    pid7 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid7, {pid7,zerolead})
    pid8 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid8, {pid8,zerolead})
    pid9 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid9, {pid9,zerolead})
    pid10 = Node.spawn(Node.self, Project1, :msg, [])
    send(pid10, {pid10,zerolead})

    msg()
  end

  def msg do
    receive do
      {pid, k} -> bitcoingen(k)
    end
  end

  def bitcoingen(zerolead) do
    k = Enum.at(zerolead,0) |> String.to_integer
    substr = String.duplicate("0",k)
    i = 1;
    input_left = "rahulp248;"
    input_right = :crypto.strong_rand_bytes(6) |> Base.encode64
    start = input_left <> input_right 
    inter = start
    keygen(k,start,inter,i,substr)
    bitcoingen(zerolead)
  end


  def keygen(k,start,inter,i,substr) do
    val_hex = :crypto.hash(:sha256,inter) |> Base.encode16 |> String.downcase
    if(String.slice(val_hex,0,k) == substr) do
      IO.puts "#{start}\t#{val_hex}"
    else
      inter = inter <> Integer.to_string(i)
      keygen(k,start,inter,i+1,substr)
    end
  end
end
