# frozen_string_literal: true

require_relative "organizador_fila_atendimento_gem/version"

module OrganizadorFilaAtendimentoGem
  class Error < StandardError; end

  class SimuladorFila
    def initialize
      @random = Random.new
      @fila = []
    end

    def adicionar_cliente(tempo_chegada)
      @fila << { tempo_chegada: tempo_chegada }
    end

    def processar_atendimento(tempo_atual)
      cliente = @fila.shift
      espera = tempo_atual - cliente[:tempo_chegada]
      puts "Cliente atendido após #{espera} unidades de tempo."
    end

    def tempo_chegada_cliente
      @random.rand(1..10)
    end

    def tempo_atendimento
      # Suponha que queremos simular tempos de atendimento entre 5 e 20 minutos
      @random.rand(5..20)
    end

    def tempo_medio_espera
      total_espera = @fila.sum { |cliente| cliente[:tempo_atendimento] }
      total_espera / @fila.size.to_f
    end

    def tempo_medio_sistema
      total_sistema = @fila.sum { |cliente| cliente[:tempo_atendimento] } + @fila.size
      total_sistema / @fila.size.to_f
    end

    def taxa_ocupacao_servidor(tempo_atual)
      total_atendimentos = tempo_atual
      (total_atendimentos / (tempo_atual * 1.0)) * 100
    end
  end

end
