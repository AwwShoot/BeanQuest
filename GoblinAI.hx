package arm.node;

@:keep class GoblinAI extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		name = "GoblinAI";
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _ApplyForce = new armory.logicnode.ApplyForceNode(this);
		var _WhileTrue = new armory.logicnode.WhileNode(this);
		var _OnInit = new armory.logicnode.OnInitNode(this);
		_OnInit.addOutputs([_WhileTrue]);
		_WhileTrue.addInput(_OnInit, 0);
		_WhileTrue.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_WhileTrue.addOutputs([_ApplyForce]);
		_WhileTrue.addOutputs([new armory.logicnode.NullNode(this)]);
		_ApplyForce.addInput(_WhileTrue, 0);
		var _SelfObject = new armory.logicnode.SelfNode(this);
		var _GetDistance = new armory.logicnode.GetDistanceNode(this);
		var _Object = new armory.logicnode.ObjectNode(this);
		_Object.addInput(new armory.logicnode.ObjectNode(this, "Cube.001"), 0);
		var _GetObjectLocation_001 = new armory.logicnode.GetLocationNode(this);
		_GetObjectLocation_001.addInput(_Object, 0);
		var _LookAt = new armory.logicnode.LookAtNode(this);
		_LookAt.property0 = "Z";
		var _GetObjectLocation = new armory.logicnode.GetLocationNode(this);
		_GetObjectLocation.addInput(_SelfObject, 0);
		_GetObjectLocation.addOutputs([_LookAt]);
		_LookAt.addInput(_GetObjectLocation, 0);
		_LookAt.addInput(_GetObjectLocation_001, 0);
		_LookAt.addOutputs([_ApplyForce]);
		_GetObjectLocation_001.addOutputs([_LookAt]);
		_Object.addOutputs([_GetDistance, _GetObjectLocation_001]);
		_GetDistance.addInput(_Object, 0);
		_GetDistance.addInput(_SelfObject, 0);
		var _Gate = new armory.logicnode.GateNode(this);
		_Gate.property0 = "Less Equal";
		_Gate.property1 = 9.999999747378752e-05;
		_Gate.addInput(new armory.logicnode.NullNode(this), 0);
		_Gate.addInput(_GetDistance, 0);
		var _Integer = new armory.logicnode.IntegerNode(this);
		_Integer.addInput(new armory.logicnode.IntegerNode(this, 10), 0);
		_Integer.addOutputs([_Gate]);
		_Gate.addInput(_Integer, 0);
		_Gate.addOutputs([new armory.logicnode.NullNode(this)]);
		_Gate.addOutputs([new armory.logicnode.NullNode(this)]);
		_GetDistance.addOutputs([_Gate]);
		var _PlayActionFrom = new armory.logicnode.PlayActionFromNode(this);
		var _Function = new armory.logicnode.FunctionNode(this);
		this.functionNodes.set("_Function", _Function);
		_Function.addOutputs([_PlayActionFrom]);
		_PlayActionFrom.addInput(_Function, 0);
		_PlayActionFrom.addInput(_SelfObject, 0);
		var _Action = new armory.logicnode.AnimActionNode(this);
		_Action.addInput(new armory.logicnode.StringNode(this, ""), 0);
		_Action.addOutputs([_PlayActionFrom]);
		_PlayActionFrom.addInput(_Action, 0);
		_PlayActionFrom.addInput(new armory.logicnode.IntegerNode(this, 0), 0);
		_PlayActionFrom.addInput(new armory.logicnode.FloatNode(this, 0.25), 0);
		_PlayActionFrom.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		_PlayActionFrom.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		var _ApplyForce_001 = new armory.logicnode.ApplyForceNode(this);
		_ApplyForce_001.addInput(_PlayActionFrom, 0);
		_ApplyForce_001.addInput(_SelfObject, 0);
		_ApplyForce_001.addInput(new armory.logicnode.VectorNode(this, 10.0, 0.0, 0.0), 0);
		_ApplyForce_001.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_ApplyForce_001.addOutputs([new armory.logicnode.NullNode(this)]);
		_PlayActionFrom.addOutputs([_ApplyForce_001]);
		_PlayActionFrom.addOutputs([new armory.logicnode.NullNode(this)]);
		_SelfObject.addOutputs([_GetDistance, _GetObjectLocation, _ApplyForce, _PlayActionFrom, _ApplyForce_001]);
		_ApplyForce.addInput(_SelfObject, 0);
		_ApplyForce.addInput(_LookAt, 0);
		_ApplyForce.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_ApplyForce.addOutputs([new armory.logicnode.NullNode(this)]);
	}

	public function Jump() {
		var functionNode = this.functionNodes["_Function"];
		functionNode.args = [];
		functionNode.run(0);
	}

}