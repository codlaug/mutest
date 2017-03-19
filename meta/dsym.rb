Mutest::Meta::Example.add :dsym do
  source ':"foo#{bar}baz"'

  singleton_mutations

  mutation ':"#{nil}#{bar}#{"baz"}"'
  mutation ':"#{self}#{bar}#{"baz"}"'
  mutation ':"#{"foo"}#{nil}#{"baz"}"'
  mutation ':"#{"foo"}#{self}#{"baz"}"'
  mutation ':"#{"foo"}#{bar}#{nil}"'
  mutation ':"#{"foo"}#{bar}#{self}"'
  mutation ':"foo__mutest__#{bar}baz"'
  mutation ':"foo#{bar}baz__mutest__"'
end
