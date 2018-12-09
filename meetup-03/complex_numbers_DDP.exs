defmodule ComplexRectangular do
  def real_part({r, _i}), do: r

  def imag_part({_r, i}), do: i

  def magnitude(z) do
    :math.sqrt(:math.pow(real_part(z), 2) +
               :math.pow(imag_part(z), 2))
  end

  def angle(z) do
    :math.atan2(imag_part(z), real_part(z))
  end

  def make_from_real_imag(r, i) do
    ComplexNumbersDDP.attach_tag(:retangular, {r, i})
  end

  def make_from_mag_ang(m, a) do
    ComplexNumbersDDP.attach_tag(:retangular, {m * :math.cos(a), m * :math.sin(a)})
  end

  def install do
    :ets.insert(:real_part, {:rectangular, &real_part/1})
    :ets.insert(:imag_part, {:rectangular, &imag_part/1})
    :ets.insert(:magnitude, {:rectangular, &magnitude/1})
    :ets.insert(:angle, {:rectangular, &angle/1})
    :ets.insert(:make_from_real_imag, {:rectangular, &make_from_real_imag/2})
    :ets.insert(:make_from_mag_ang, {:rectangular, &make_from_mag_ang/2})
  end
end

defmodule ComplexPolar do
  def magnitude({m, _a}), do: m

  def angle({_m, a}), do: a

  def real_part(z) do
    magnitude(z) * :math.cos(angle(z))
  end

  def imag_part(z) do
    magnitude(z) * :math.sin(angle(z))
  end

  def make_from_mag_ang(m, a) do
    ComplexNumbersDDP.attach_tag(:polar, {m, a})
  end

  def make_from_real_imag(r, i) do
    ComplexNumbersDDP.attach_tag(:polar, {
      :math.sqrt(:math.pow(r, 2)+ :math.pow(i, 2)),
      :math.atan2(i, r)
    })
  end

  def install do
    :ets.insert(:real_part, {:polar, &real_part/1})
    :ets.insert(:imag_part, {:polar, &imag_part/1})
    :ets.insert(:magnitude, {:polar, &magnitude/1})
    :ets.insert(:angle, {:polar, &angle/1})
    :ets.insert(:make_from_real_imag, {:polar, &make_from_real_imag/2})
    :ets.insert(:make_from_mag_ang, {:polar, &make_from_mag_ang/2})
  end
end

defmodule ComplexNumbersDDP do
  def create_tables do
    :ets.new(:real_part, [:named_table])
    :ets.new(:imag_part, [:named_table])
    :ets.new(:magnitude, [:named_table])
    :ets.new(:angle, [:named_table])
    :ets.new(:make_from_real_imag, [:named_table])
    :ets.new(:make_from_mag_ang, [:named_table])
    ComplexRectangular.install
    ComplexPolar.install
  end

  # TAGGED DATA
  def attach_tag(type_tag, contents), do: {type_tag, contents}

  def type_tag({type_tag, _contents}), do: type_tag

  def contents({_type_tag, contents}), do: contents

  def apply_generic(op, args) do 
    type_tag = type_tag(args)
    contents = contents(args)
    function = :ets.lookup(op, type_tag)
    function[type_tag].(contents)
  end

  def real_part(z), do: apply_generic(:real_part, z)

  def imag_part(z), do: apply_generic(:imag_part, z)

  def magnitude(z), do: apply_generic(:magnitude, z)

  def angle(z), do: apply_generic(:angle, z)

  def make_from_real_imag(r, i) do
    function = :ets.lookup(:make_from_real_imag, :rectangular)
    function[:rectangular].(r, i)
  end

  def make_from_mag_ang(m, a) do
    function = :ets.lookup(:make_from_mag_ang, :polar)
    function[:polar].(m, a)
  end

  # GENERIC PROCEDURES
  def add_complex(z1, z2) do
    make_from_real_imag(real_part(z1) + real_part(z2),
                        imag_part(z1) + imag_part(z2))
  end

  def sub_complex(z1, z2) do
    make_from_real_imag(real_part(z1) - real_part(z2),
                        imag_part(z1) - imag_part(z2))
  end

  def mul_complex(z1, z2) do
    make_from_mag_ang(magnitude(z1) * magnitude(z2),
                      angle(z1) + angle(z2))
  end

  def div_complex(z1, z2) do
    make_from_mag_ang(magnitude(z1) / magnitude(z2),
                      angle(z1) - angle(z2))
  end

end



