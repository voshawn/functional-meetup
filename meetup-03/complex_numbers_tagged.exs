defmodule ComplexNumbersTagged do
  # START RECTANGULAR FORM
  def real_part_rectangular({r, _i}), do: r

  def imag_part_rectangular({_r, i}), do: i

  def magnitude_rectangular(z) do
    :math.sqrt(:math.pow(real_part_rectangular(z), 2) +
               :math.pow(imag_part_rectangular(z), 2))
  end

  def angle_rectangular(z) do
    :math.atan2(imag_part_rectangular(z), real_part_rectangular(z))
  end

  def make_from_real_imag_rectangular(r, i) do
    attach_tag(:rectangular, {r, i})
  end

  def make_from_mag_ang_rectangular(m, a) do
    attach_tag(:rectangular, {m * :math.cos(a), m * :math.sin(a)})
  end
  # END RECTANGULAR FORM

  # START POLAR FORM
  def magnitude_polar({m, _a}), do: m

  def angle_polar({_m, a}), do: a

  def real_part_polar(z) do
    magnitude_polar(z) * :math.cos(angle_polar(z))
  end

  def imag_part_polar(z) do
    magnitude_polar(z) * :math.sin(angle_polar(z))
  end

  def make_from_mag_ang_polar(m, a) do
    attach_tag(:polar, {m, a})
  end

  def make_from_real_imag_polar(r, i) do
    attach_tag(:polar, {
      :math.sqrt(:math.pow(r, 2)+ :math.pow(i, 2)),
      :math.atan2(i, r)
    })
  end
  # END POLAR FORM

  # START TAGGED DATA
  def attach_tag(type_tag, contents), do: {type_tag, contents}

  def type_tag({type_tag, _contents}), do: type_tag

  def contents({_type_tag, contents}), do: contents

  def rectangular?({type_tag, _contents}) when type_tag == :rectangular, do: true
  def rectangular?({_type_tag, _contents}), do: false

  def polar?({type_tag, _contents}) when type_tag == :polar, do: true
  def polar?({_type_tag, _contents}), do: false

  def real_part(z) do
    cond do
      rectangular?(z) ->
        real_part_rectangular(contents(z))
      polar?(z) ->
        real_part_polar(contents(z))
      true -> IO.puts("Unknown Type!")
    end
  end

  def imag_part(z) do
    cond do
      rectangular?(z) ->
        imag_part_rectangular(contents(z))
      polar?(z) ->
        imag_part_polar(contents(z))
      true -> IO.puts("Unknown Type!")
    end
  end

  def magnitude(z) do
    cond do
      rectangular?(z) ->
        magnitude_rectangular(contents(z))
      polar?(z) ->
        magnitude_polar(contents(z))
      true -> IO.puts("Unknown Type!")
    end
  end

  def angle(z) do
    cond do
      rectangular?(z) ->
        angle_rectangular(contents(z))
      polar?(z) ->
        angle_polar(contents(z))
      true -> IO.puts("Unknown Type!")
    end
  end

  def make_from_real_imag(r, i) do
    make_from_real_imag_rectangular(r, i)
  end

  def make_from_mag_ang(m, a) do
    make_from_mag_ang_polar(m, a)
  end
  # END TAGGED DATA


  # START GENERIC PROCEDURES
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
  # END GENERIC PROCEDURES

end



