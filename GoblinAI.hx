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
		var _Gate = new armory.logicnode.GateNode(this);
		_Gate.property0 = "Less Equal";
		_Gate.property1 = 9.999999747378752e-05;
		_Gate.addInput(new armory.logicnode.NullNode(this), 0);
		var _GetDistance = new armory.logicnode.GetDistanceNode(this);
		var _Object = new armory.logicnode.ObjectNode(this);
		_Object.addInput(new armory.logicnode.ObjectNode(this, "Cube.001"), 0);
		var _GetObjectLocation_001 = new armory.logicnode.GetLocationNode(this);
		_GetObjectLocation_001.addInput(_Object, 0);
		var _LookAt = new armory.logicnode.LookAtNode(this);
		_LookAt.property0 = "Y";
		var _GetObjectLocation = new armory.logicnode.GetLocationNode(this);
		var _SelfObject = new armory.logicnode.SelfNode(this);
		var _ApplyForce = new armory.logicnode.ApplyForceNode(this);
		var _SetObjectRotation = new armory.logicnode.SetRotationNode(this);
		_SetObjectRotation.property0 = "Euler Angles";
		var _OnEvent = new armory.logicnode.OnEventNode(this);
		_OnEvent.property0 = "move";
		_OnEvent.addOutputs([_SetObjectRotation]);
		_SetObjectRotation.addInput(_OnEvent, 0);
		_SetObjectRotation.addInput(_SelfObject, 0);
		_SetObjectRotation.addInput(_LookAt, 0);
		_SetObjectRotation.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_SetObjectRotation.addOutputs([_ApplyForce]);
		_ApplyForce.addInput(_SetObjectRotation, 0);
		_ApplyForce.addInput(_SelfObject, 0);
		_ApplyForce.addInput(new armory.logicnode.VectorNode(this, 0.0, 25.0, 0.0), 0);
		_ApplyForce.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_ApplyForce.addOutputs([new armory.logicnode.NullNode(this)]);
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
		var _SetObjectLocation = new armory.logicnode.SetLocationNode(this);
		var _Keyboard = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard.property0 = "down";
		_Keyboard.property1 = "q";
		_Keyboard.addOutputs([_SetObjectLocation]);
		_Keyboard.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_SetObjectLocation.addInput(_Keyboard, 0);
		_SetObjectLocation.addInput(_SelfObject, 0);
		_SetObjectLocation.addInput(new armory.logicnode.VectorNode(this, -4.0, 4.0, 4.0), 0);
		var _SetRBVelocity = new armory.logicnode.SetVelocityNode(this);
		_SetRBVelocity.addInput(_SetObjectLocation, 0);
		_SetRBVelocity.addInput(_SelfObject, 0);
		_SetRBVelocity.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0), 0);
		_SetRBVelocity.addInput(new armory.logicnode.VectorNode(this, 1.0, 1.0, 1.0), 0);
		_SetRBVelocity.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0), 0);
		_SetRBVelocity.addInput(new armory.logicnode.VectorNode(this, 1.0, 1.0, 1.0), 0);
		_SetRBVelocity.addOutputs([new armory.logicnode.NullNode(this)]);
		_SetObjectLocation.addOutputs([_SetRBVelocity]);
		_SelfObject.addOutputs([_GetDistance, _GetObjectLocation, _ApplyForce, _PlayActionFrom, _ApplyForce_001, _SetObjectRotation, _SetObjectLocation, _SetRBVelocity]);
		_GetObjectLocation.addInput(_SelfObject, 0);
		_GetObjectLocation.addOutputs([_LookAt]);
		_LookAt.addInput(_GetObjectLocation, 0);
		_LookAt.addInput(_GetObjectLocation_001, 0);
		_LookAt.addOutputs([_SetObjectRotation]);
		_GetObjectLocation_001.addOutputs([_LookAt]);
		_Object.addOutputs([_GetDistance, _GetObjectLocation_001]);
		_GetDistance.addInput(_Object, 0);
		_GetDistance.addInput(_SelfObject, 0);
		_GetDistance.addOutputs([_Gate]);
		_Gate.addInput(_GetDistance, 0);
		var _Integer = new armory.logicnode.IntegerNode(this);
		_Integer.addInput(new armory.logicnode.IntegerNode(this, 10), 0);
		_Integer.addOutputs([_Gate]);
		_Gate.addInput(_Integer, 0);
		_Gate.addOutputs([new armory.logicnode.NullNode(this)]);
		_Gate.addOutputs([new armory.logicnode.NullNode(this)]);
	}

	public function Jump() {
		var functionNode = this.functionNodes["_Function"];
		functionNode.args = [];
		functionNode.run(0);
	}

}