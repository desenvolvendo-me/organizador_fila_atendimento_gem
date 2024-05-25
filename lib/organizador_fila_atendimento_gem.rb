# frozen_string_literal: true

require_relative "organizador_fila_atendimento_gem/version"

module OrganizadorFilaAtendimentoGem
  class Error < StandardError; end

  class SimuladorFila
    def initialize
      @random = Random.new
    end

    def tempo_chegada_cliente
      # Suponha que queremos simular tempos de chegada de clientes entre 1 e 10 minutos
      @random.rand(1..10)
    end

    def tempo_atendimento
      # Suponha que queremos simular tempos de atendimento entre 5 e 20 minutos
      @random.rand(5..20)
    end
  end

end
