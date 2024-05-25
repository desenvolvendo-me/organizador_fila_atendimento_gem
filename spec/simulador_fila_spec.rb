# spec/simulador_fila_spec.rb

require "organizador_fila_atendimento_gem"

RSpec.describe OrganizadorFilaAtendimentoGem::SimuladorFila do
  describe "#adicionar_cliente" do
    it "adiciona um cliente à fila" do
      simulador = OrganizadorFilaAtendimentoGem::SimuladorFila.new
      expect { simulador.adicionar_cliente(5) }.to change { simulador.instance_variable_get(:@fila).size }.from(0).to(1)
    end
  end

  describe "#processar_atendimento" do
    it "remove o cliente da fila e calcula o tempo de espera" do
      simulador = OrganizadorFilaAtendimentoGem::SimuladorFila.new
      simulador.adicionar_cliente(5)
      expect { simulador.processar_atendimento(10) }.to output("Cliente atendido após 5 unidades de tempo.\n").to_stdout
    end
  end

  describe "#tempo_chegada_cliente" do
    it "gera um tempo de chegada de cliente entre 1 e 10 minutos" do
      simulador = described_class.new
      tempo_chegada = simulador.tempo_chegada_cliente
      expect(tempo_chegada).to be_between(1, 10)
    end
  end

  describe "#tempo_atendimento" do
    it "gera um tempo de atendimento entre 5 e 20 minutos" do
      simulador = described_class.new
      tempo_atendimento = simulador.tempo_atendimento
      expect(tempo_atendimento).to be_between(5, 20)
    end
  end
end
